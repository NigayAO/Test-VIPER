//
//  ViewController.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayImage(with imageData: Data)
    func displayImageForFavoriteButton(with status: Bool)
}

protocol CourseDetailsViewOutputProtocol {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
        
    var course: Course!
    var presenter: CourseDetailsViewOutputProtocol!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func favoriteButtonPressed() {
        presenter.favoriteButtonPressed()
    }
}

//MARK: - CourseDetailsViewInputProtocol
extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    func displayCourseName(with title: String) {
        titleLabel.text = title
    }
    func displayNumberOfLessons(with title: String) {
        numberOfLessons.text = title
    }
    func displayNumberOfTests(with title: String) {
        numberOfTests.text = title
    }
    func displayImage(with imageData: Data) {
        imageLabel.image = UIImage(data: imageData)
    }
    func displayImageForFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
