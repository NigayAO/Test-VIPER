//
//  CourseCell.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

class CourseCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        
        var configure = defaultContentConfiguration()
        configure.text = viewModel.courseName
        if let imageData = viewModel.imageData {
            configure.image = UIImage(data: imageData)
        }
        contentConfiguration = configure
    }
}
