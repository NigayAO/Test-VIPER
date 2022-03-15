//
//  CourseListRouter.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseListRouterInputProtocol {
    init(viewController: CourseList)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterInputProtocol {
    
    unowned let viewController: CourseList
    
    required init(viewController: CourseList) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: "showCourse", sender: course)
    }
}
