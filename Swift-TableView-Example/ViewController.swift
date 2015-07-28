//
//  ViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    
//    internal struct Recipe {
//        let name: String
//        let thumbnails: String
//        let prepTime: String
//    }
    var recipes = [Recipe]()
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Recipes"
        
        initializeTheRecipes()
        tableView?.reloadData()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initializeTheRecipes() {
        self.recipes = [Recipe(name: "Egg Benedict", thumbnails: "egg_benedict.jpg", prepTime: "1 hour"),
            Recipe(name: "Mushroom Risotto", thumbnails: "mushroom_risotto.jpg", prepTime: "30 min"),
            Recipe(name: "Full Breakfast", thumbnails: "full_breakfast.jpg", prepTime: "25 min"),
            Recipe(name: "Hamburger", thumbnails: "hamburger.jpg", prepTime: "15 min"),
            Recipe(name: "Ham and Egg Sandwich", thumbnails: "ham_and_egg_sandwich.jpg", prepTime: "20 min"),
            Recipe(name: "Creme Brelee", thumbnails: "creme_brelee.jpg", prepTime: "10 min"),
            Recipe(name: "White Chocolate Donut", thumbnails: "white_chocolate_donut.jpg", prepTime: "1 hour"),
            Recipe(name: "Starbucks Coffee", thumbnails: "starbucks_coffee.jpg", prepTime: "2 hour"),
            Recipe(name: "Vegetable Curry", thumbnails: "vegetable_curry.jpg", prepTime: "50 min"),
            Recipe(name: "Instant Noodle with Egg", thumbnails: "instant_noodle_with_egg.jpg", prepTime: "65 min"),
            Recipe(name: "Noodle with BBQ Pork", thumbnails: "noodle_with_bbq_pork.jpg", prepTime: "40 min"),
            Recipe(name: "Japanese Noodle with Pork", thumbnails: "japanese_noodle_with_pork.jpg", prepTime: "30 min"),
            Recipe(name: "Green Tea", thumbnails: "green_tea.jpg", prepTime: "25 min"),
            Recipe(name: "Thai Shrimp Cake", thumbnails: "thai_shrimp_cake.jpg", prepTime: "1.5 hour"),
            Recipe(name: "Angry Birds Cake", thumbnails: "angry_birds_cake.jpg", prepTime: "2 hour"),
            Recipe(name: "Ham and Cheese Panini", thumbnails: "ham_and_cheese_panini.jpg", prepTime: "35 min")]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "tableCell"

        var cell: TableCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell.configurateTheCell(recipes[indexPath.row])
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            recipes.removeAtIndex(indexPath.row)
            self.tableView!.reloadData()
            self.tableView!.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "recipeDetail" {
            let indexPath = self.tableView!.indexPathForSelectedRow
            let destinationViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            destinationViewController.prepString = recipes[indexPath()!.row].prepTime
            destinationViewController.nameString = recipes[indexPath()!.row].name
            destinationViewController.imageName = recipes[indexPath()!.row].thumbnails
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
}
