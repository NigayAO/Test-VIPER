//
//  CourseList.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

protocol CourseListInputProtocol: AnyObject {
    func reloadData(for section: CourseSectionViewModel)
}

protocol CourseListOutputProtocol {
    init(view: CourseListInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CourseList: UITableViewController {
    
    var presenter: CourseListOutputProtocol!
    
    private var sectionViewModel: CourseSectionViewModelProtocol = CourseSectionViewModel()
    private var configurator: CourseListConfiguratorInputProtocol = CourseListConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as! CourseCell
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let courseVC = segue.destination as? CourseDetailsViewController else { return }
        let courseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol = CourseDetailsConfigurator()
        courseDetailsConfigurator.configure(with: courseVC, and: sender as! Course)
    }
}

//MARK: - UITableViewDelegate
extension CourseList {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
}

//MARK: - CourseListOutputProtocol
extension CourseList: CourseListInputProtocol {
    func reloadData(for section: CourseSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}
