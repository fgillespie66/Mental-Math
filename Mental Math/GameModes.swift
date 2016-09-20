//
//  GameModes.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 9/18/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

import UIKit

class GameModes: NSObject {
    // MARK: Properties 
    
    var name: String
    var photo: UIImage?
    var highScore: String
    
    // MARK: Initialization
    
    init(name: String, photo: UIImage?, highScore: String) {
        self.name = name
        self.photo = photo
        self.highScore = highScore
        
        super.init()
    }
    
}