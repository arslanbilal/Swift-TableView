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

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var prepTime: UILabel!
    @IBOutlet var cookedButton: UIButton!
    @IBOutlet var ratingControl: UISegmentedControl!

    var recipeIndex: Int?
    var recipes: [Recipe]?
    var recipe: Recipe? {
        guard let recipeIndex = recipeIndex else { return nil }
        guard let recipes = recipes else { return nil }
        return recipes[recipeIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView() {
        guard let recipe = recipe else { return }
        navigationItem.title = recipe.name
        imageView.image = UIImage(named: recipe.thumbnails)
        nameLabel.text = recipe.name
        prepTime.text = "Prep Time: " + recipe.prepTime
        cookedButton.setTitle(recipe.cooked ? "Cooked" : "Not Cooked", for: .normal)
        ratingControl.selectedSegmentIndex = (recipe.rating != nil) ? recipe.rating! : 0
    }

    @IBAction
    func cookedAction() {
        guard let recipe = recipe else { return }
        guard let recipeIndex = recipeIndex else { return }
        let updatedRecipe = Recipe(name: recipe.name, thumbnails: recipe.thumbnails, prepTime: recipe.prepTime, rating: recipe.rating, cooked: !recipe.cooked)
        self.recipes![recipeIndex] = updatedRecipe
        self.saveRecipes()
        self.updateView()
    }

    @IBAction
    func ratingAction() {
        guard let recipe = recipe else { return }
        guard let recipeIndex = recipeIndex else { return }
        let updatedRecipe = Recipe(name: recipe.name, thumbnails: recipe.thumbnails, prepTime: recipe.prepTime, rating: ratingControl.selectedSegmentIndex, cooked: recipe.cooked)
        self.recipes![recipeIndex] = updatedRecipe
        self.saveRecipes()
        self.updateView()
    }

    func saveRecipes() {
        guard let recipes = recipes else { return }

        // Show saving modal
        let savingView = UIViewController()
        let savingLabel = UILabel()
        savingLabel.text = "Saving..."
        savingView.view.addSubview(savingLabel)
        self.present(savingView, animated: true, completion: nil)

        // Save recipe data to defaults
        DispatchQueue.global().async {
            do {
                let recipeJSON = try JSONEncoder().encode(recipes)
                UserDefaults.init(suiteName: "Recipes Defaults")?.set(recipeJSON, forKey: "Recipes")
            } catch {
                let alert = UIAlertController(title: "Error Saving Recipes", message: "Error Saving Recipes: \(error)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }

            // Hide saving modal
            DispatchQueue.main.sync {
                savingView.dismiss(animated: true, completion: nil)
            }
        }
    }
}
