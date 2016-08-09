//
//  TeamNames.swift
//  IPL2016
//
//
//  Created by BridgeLabz on 05/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class dataController: NSObject
{
    
    var requestObject : RequestingResponse!
    var viewModelObject : TeamNamesViewModel!
    var playerViewModelObject : PlayerNamesViewModel!
    
    init(obj : TeamNamesViewModel)
    {
        super.init()
        viewModelObject = obj
        requestObject = RequestingResponse(obj: self)
    }
    init(ob : PlayerNamesViewModel) {
        super.init()
        playerViewModelObject = ob
        requestObject = RequestingResponse(obj: self)
    }
    
    func makeRequest(req : String)
    {
        requestObject.request(req)
    }
    
    func teamData(tempArray : [NSDictionary])
    {
        viewModelObject.updateDataArray(tempArray)
        for i in 0..<tempArray.count
        {
            requestObject.requestImage(tempArray[i].valueForKey("team_img_url") as! String, index: i )
        }
        
    }
    
    func imageData(data : NSData , index : Int)
    {
        viewModelObject.logoImageData(UIImage(data: data)! , index : index)
    }
    
    
    func playerRequest(req : String)
    {
        let str = "players/" + req
        requestObject.player(str)
    }
    
    func playerData(tempArray : [NSDictionary])
    {
        for i in 0..<tempArray.count - 20
        {
            requestObject.requestPlayerImage(tempArray[i].valueForKey("player_img_url") as! String, index: i)
        }
        playerViewModelObject.updateDataArray(tempArray)
        
    }
    
    func playerImagedata(data : NSData , index : Int) {
        playerViewModelObject.playerImage(UIImage(data: data)! , index : index)
    }
}
