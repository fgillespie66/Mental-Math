//
//  Level.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 3/24/17.
//  Copyright © 2017 Fiona Gillespie. All rights reserved.
//

import UIKit

class Level
{
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var highScore: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, highScore:Int)
    {
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.highScore = highScore
        
        //  no empty name
        guard !name.isEmpty else
        {
            return nil
        }

    }
    
   }
