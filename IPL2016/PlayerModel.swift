//
//  Player.swift
//  IPL2016
//

//Purpose : Model class with player information details


//  Created by BridgeLabz on 09/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class Player: NSObject
{
    var name : String?
    var profilepicture : UIImage?
    var role : String?
    var dateofbirth : String?
    var battingstyle : String?
    var bowlingstyle : String?
    var nationality : String?
    
    //Constructor with data
    init(n : String , picture : UIImage , role : String , dob : String, bts : String , bws : String , nation : String)
    {
        
        self.name = n
        self.profilepicture = picture
        self.role = role
        self.dateofbirth = dob
        self.battingstyle = bts
        self.bowlingstyle = bws
        self.nationality = nation
        
    }
    
}
