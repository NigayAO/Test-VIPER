//
//  CourseCellViewModel.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var cellIdentifier: String {
        "course"
    }
    
    var cellHeight: Double {
        100
    }
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImage(url: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}

class CourseSectionViewModel: CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] = []
}
