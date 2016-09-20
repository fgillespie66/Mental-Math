//
//  homeScreenViewController.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 9/5/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

import UIKit

class homeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gameModes = [GameModes]()
    
    @IBOutlet weak var table: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(gameModes.count)
        return gameModes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // your cell coding
        // return UITableViewCell()
        
        let cellIdentifier = "homeScreenTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! homeScreenTableViewCell
        
        let gameMode = gameModes[indexPath.row]
        cell.gameLabel.text = gameMode.name
        cell.photoImageView.image = gameMode.photo
        cell.highScoreLabel.text = String(gameMode.highScore)
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load games
        loadGames()
        
        table.delegate = self
        table.dataSource = self
    }

    func loadGames() {
        let photo1 = UIImage(named: "arithmetic")!
        let game1 = GameModes(name: "Arithmetic", photo: photo1, highScore: " " )
        // FIX HIGH SCORE
        gameModes += [game1]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
