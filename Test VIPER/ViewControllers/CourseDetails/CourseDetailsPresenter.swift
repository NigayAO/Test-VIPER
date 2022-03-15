//
//  CourseDetailsPresenter.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    let isFavorite: Bool
}


class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    private unowned let view: CourseDetailsViewInputProtocol!
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
    }
}


//MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receivedCourseDetails(with courseData: CourseDetailsData) {
        
        let numberOfLessons = "Number of lessons: \(courseData.numberOfLessons)"
        let numberOfTests = "Number of tests: \(courseData.numberOfTests)"
        
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numberOfTests)
        view.displayImageForFavoriteButton(with: courseData.isFavorite)
        
        guard let imageData = courseData.imageData else { return }
        view.displayImage(with: imageData)
    }
    
    func receivedFavoriteStatus(with status: Bool) {
        view.displayImageForFavoriteButton(with: status)
    }
}

