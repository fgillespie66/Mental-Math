//
//  OverlayView.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 8/31/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

/*
import UIKit

class OverlayView: UIView {

    // Custom view from XIB file
    var view:UIView!
    
    // Returns: loaded view
    func loadViewFromXibFile() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "OverlayView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    // Initialiser Method
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // Sets up the view by loading it from the xib file and setting its frame
    override func setupView() {
        view = loadViewFromXibFile()
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = NSLocalizedString("Saved_to_garage", comment: "")
        
        // Addas a shadow to our view
    }
}
*/