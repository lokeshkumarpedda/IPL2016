//
//  PlayerNamesViewModel.swift
//  IPL2016
//
//  Created by BridgeLabz on 08/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerNamesViewModel: NSObject {

    var playerData : dataController!
    var playerViewController : PlayerNamesViewController!
    
    var dataArray = [NSDictionary]()
    var playerImageArray = [UIImage]()
    init(obj : PlayerNamesViewController)
    {
        super.init()
        playerViewController = obj
        playerData = dataController(ob: self)
    }
    
    func getData(team : String) {
        playerData.playerRequest(team)
    }
    
    func updateDataArray(tempArray : [NSDictionary]){
        dataArray = tempArray
        for _ in 0..<tempArray.count
        {
            playerImageArray.append(UIImage(named: "playerDummy")!)
        }
        playerViewController.reload()
    }
    func playerImage(image : UIImage , index : Int) {
        playerImageArray[index] = image
        playerViewController.reload()
    }
    
    func numberOfRows() -> Int
    {
        return dataArray.count
    }
    
    func playerName(index : Int) -> String
    {
        return dataArray[index].valueForKey("player_name") as! String
    }
    
    func profileImage(index : Int) -> UIImage
    {
        
        return playerImageArray[index]
        
    }
}
