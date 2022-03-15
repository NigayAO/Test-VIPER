//
//  CourseList.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

class CourseList: UITableViewController {
    
    private var courses: [Course] = []
    private var course: Course!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        downloadCourses()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath) as! CourseCell
        let course = courses[indexPath.row]
        cell.customConfigure(course: course)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        course = courses[indexPath.row]
        performSegue(withIdentifier: "showCourse", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let courseVC = segue.destination as? CourseView else { return }
        courseVC.course = course
    }
    
    private func downloadCourses() {
        NetworkManager.shared.fetchData(completion: { result in
            switch result {
            case .success(let fetchCourses):
                self.courses = fetchCourses
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
}
