//
//  CourseCell.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

class CourseCell: UITableViewCell {
    func customConfigure(course: Course) {
        var configure = defaultContentConfiguration()
        configure.text = course.name
        if let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl) {
            configure.image = UIImage(data: imageData)
        }
        contentConfiguration = configure
    }
}
