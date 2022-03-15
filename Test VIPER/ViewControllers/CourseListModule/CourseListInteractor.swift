//
//  CourseListInteractor.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

protocol CourseListInteractorInputProtocol {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func coursesDidReceived(with dataStore: CourseListDataStore)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned let presenter: CourseListInteractorOutputProtocol!
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let courses):
                let dataStore = CourseListDataStore(courses: courses)
                self.presenter.coursesDidReceived(with: dataStore)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
