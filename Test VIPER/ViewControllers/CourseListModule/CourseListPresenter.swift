//
//  CourseListPresenter.swift
//  Test VIPER
//
//  Created by Alik Nigay on 15.03.2022.
//

import Foundation

struct CourseListDataStore {
    let courses: [Course]
}

class CourseListPresenter: CourseListOutputProtocol {
    unowned let view: CourseListInputProtocol!
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    private var dataStore: CourseListDataStore?
    
    required init(view: CourseListInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.openCourseDetailsViewController(with: course)
    }
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceived(with dataStore: CourseListDataStore) {
        self.dataStore = dataStore
        let section = CourseSectionViewModel()
        dataStore.courses.forEach { section.rows.append(CourseCellViewModel(course: $0)) }
        view.reloadData(for: section)
    }
}
