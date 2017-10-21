//
//  DetailViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var prepTime: UILabel?
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = recipe?.name
        imageView?.image = UIImage(named: recipe!.thumbnails)
        nameLabel?.text = recipe!.name
        prepTime?.text = "Prep Time: " + recipe!.prepTime
    }    
}
