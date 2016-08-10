//
//  PlayerInformationViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 09/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerInformationViewController: UIViewController {

//MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var dateofbirth: UILabel!
    @IBOutlet weak var nationality: UILabel!
    
    
    var playerObject : Player!
    var playerNamesVCObject  : PlayerNamesViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Getting player information from player model object
        let temp = playerNamesVCObject.playerInfo() as! Player
        
        
        //Assigning values to the respective element with the data of model object
        imageView.image = temp.profilepicture
        playerName.text = temp.name
        playerRole.text = temp.role
        battingStyle.text = temp.battingstyle
        bowlingStyle.text = temp.bowlingstyle
        dateofbirth.text = temp.dateofbirth
        nationality.text = temp.nationality
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
