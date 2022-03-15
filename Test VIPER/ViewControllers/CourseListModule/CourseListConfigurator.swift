//
//  CourseListConfigurator.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseList)
}

class CourseListConfigurator: CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseList) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
