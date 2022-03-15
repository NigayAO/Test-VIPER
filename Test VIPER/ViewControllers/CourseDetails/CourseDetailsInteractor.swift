//
//  CourseDetailsInteractor.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol {
    var isFavorite: Bool { get }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    
    func provideCourseDetails()
    func toggleFavoriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receivedCourseDetails(with courseData: CourseDetailsData)
    func receivedFavoriteStatus(with status: Bool)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    var isFavorite: Bool {
        get {
            StorageManager.shared.getFavoriteState(key: course.name)
        } set {
            StorageManager.shared.setFavoriteState(value: newValue, forKey: course.name)
        }
    }
    
    private unowned let presenter: CourseDetailsInteractorOutputProtocol!
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl)
        let courseDetailsData = CourseDetailsData(
            courseName: course.name,
            numberOfLessons: course.number_of_lessons,
            numberOfTests: course.number_of_tests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter.receivedCourseDetails(with: courseDetailsData)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
        presenter.receivedFavoriteStatus(with: isFavorite)
    }
}
