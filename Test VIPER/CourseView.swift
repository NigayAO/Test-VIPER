//
//  ViewController.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import UIKit

class CourseView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var course: Course!
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        setup()
    }
    
    @IBAction func favoriteButtonPressed() {
        isFavorite.toggle()
        StorageManager.shared.setFavoriteState(value: isFavorite, forKey: course.name)
        favoriteState()
    }
    
    private func setup() {
        titleLabel.text = course.name
        
        if let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl) {
            activityIndicator.stopAnimating()
            imageLabel.image = UIImage(data: imageData)
        }
        
        isFavorite = StorageManager.shared.getFavoriteState(key: course.name)
        favoriteState()
        
        numberOfLessons.text = "Number of lessons: \(course.number_of_lessons)"
        numberOfTests.text = "Number of tests: \(course.number_of_tests)"
    }
    
    private func favoriteState() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
}

