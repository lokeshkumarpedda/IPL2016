//
//  PlayerNamesViewModel.swift
//  IPL2016
//

//Purpose: Get the data from the Data controller and send it to the view controller when requested

//  Created by BridgeLabz on 08/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerNamesViewModel: NSObject {

    var playerData : dataController!
    var playerViewController : PlayerNamesViewController!
    
    //Taking empty dictionary array to store the player information
    var dataArray = [NSDictionary]()
    
    //for storing player images
    var playerImageArray = [UIImage]()
    
    init(obj : PlayerNamesViewController)
    {
        
        super.init()
        playerViewController = obj
        playerData = dataController(ob: self)
        
    }
    
    //MARK: Geting the Data
    
    //Sending request to Datacontroller
    func getData(team : String)
    {
        
        playerData.playerRequest(team)
        
    }
    
    //Get the data and reload the table with new data
    func updateDataArray(tempArray : [NSDictionary])
    {
        
        dataArray = tempArray
        
        //initializing with dummy image
        for _ in 0..<tempArray.count
        {
            
            playerImageArray.append(UIImage(named: "playerDummy")!)
            
        }
        
        playerViewController.reload()
        
    }
    
    //When image is recieved it will store in the array and reload the table view
    func playerImage(image : UIImage , index : Int)
    {
        
        playerImageArray[index] = image
        playerViewController.reload()
        
    }
    

    
    //MARK: Sending the data
    
    //returns the total players number
    func numberOfRows() -> Int
    {
        
        return dataArray.count
        
    }
    
    //returns player name
    func playerName(index : Int) -> String
    {
        
        return dataArray[index].valueForKey("player_name") as! String
        
    }
    
    //returns player picture
    func profileImage(index : Int) -> UIImage
    {
        
        return playerImageArray[index]
        
    }
    
    
    //MARK: Model Creation
    
    //creating model object to display player information
    func creatingModel(index : Int) -> NSObject?
    {
        
        let name = dataArray[index].valueForKey("player_name") as! String
        let role = dataArray[index].valueForKey("player_role") as! String
        let battingStyle = dataArray[index].valueForKey("player_batting_style") as! String
        let bowlingStyle = dataArray[index].valueForKey("player_bowling_style") as! String
        let dateofbirth = dataArray[index].valueForKey("player_dob") as! String
        let nationality = dataArray[index].valueForKey("player_nationality") as! String
        let image = playerImageArray[index]
        
        let playerObject = Player(n: name, picture: image, role: role, dob: dateofbirth, bts: battingStyle, bws: bowlingStyle, nation: nationality)
        return playerObject
        
    }
}
