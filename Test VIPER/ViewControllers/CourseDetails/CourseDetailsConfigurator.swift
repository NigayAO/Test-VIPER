//
//  CourseDetailsConfigurator.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseDetailsConfiguratorInputProtocol {
    func configure(with viewController: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol {
    func configure(with viewController: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: viewController)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
