//
//  Recipe.swift
//  Swift-TableView-Example
//
//  Created by Bilal Arslan on 28/07/15.
//  Copyright (c) 2015 Bilal ARSLAN. All rights reserved.
//

import Foundation

class Recipe: NSObject {
    let name: String
    let thumbnails: String
    let prepTime: String
    
    init(name: String, thumbnails: String, prepTime: String) {
        self.name = name
        self.thumbnails = thumbnails
        self.prepTime = prepTime
    }
}
