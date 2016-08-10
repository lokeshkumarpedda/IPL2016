//
//  TeamNames.swift
//  IPL2016
//

//Purpose: Get the Data from firebase and send it to the respective view models

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
    
//MARK: Teams Data
    
    init(obj : TeamNamesViewModel)
    {
        
        super.init()
        viewModelObject = obj
        requestObject = RequestingResponse(obj: self)
        
    }
    
    //Make a request to firebase
    func makeRequest(req : String)
    {
        
        requestObject.request(req)
        
    }
    
    //get the data array from the response and send it the team names view model
    func teamData(tempArray : [NSDictionary])
    {
        
        viewModelObject.updateDataArray(tempArray)
        
        //sending request to get logo image
        for i in 0..<tempArray.count
        {
            requestObject.requestImage(tempArray[i].valueForKey("team_img_url") as! String, index: i )
        }
    }
    
    //recieve the image from server and give it to the viewmodel
    func imageData(data : NSData , index : Int)
    {
        
        viewModelObject.logoImageData(UIImage(data: data)! , index : index)
        
    }
    
    
//MARK: Players Data
    
    init(ob : PlayerNamesViewModel) {
        
        super.init()
        playerViewModelObject = ob
        requestObject = RequestingResponse(obj: self)
        
    }
    
    //making request to firebase
    func playerRequest(req : String)
    {
        
        let str = "players/" + req
        requestObject.player(str)
        
    }
    
    //getting the data and sending it to the view model
    func playerData(tempArray : [NSDictionary])
    {
        
        playerViewModelObject.updateDataArray(tempArray)
        
        //making request for player images
        for i in 0..<5
        {
            requestObject.requestPlayerImage(tempArray[i].valueForKey("player_img_url") as! String, index: i)
        }
    }
    
    //getting the player image and sending it to the view model
    func playerImagedata(data : NSData , index : Int)
    {
        
        playerViewModelObject.playerImage(UIImage(data: data)! , index : index)
        
    }
    
    
    
    func infoRequest()
    {
        let str = "players/Delhi Daredevils/0"
        requestObject.info(str)
    }
}
