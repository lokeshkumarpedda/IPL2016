//
//  ResponseHandler.swift
//  IPL2016
//

//Purpose: Handle the response which is coming from RequiestingResponse class

//  Created by BridgeLabz on 05/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class ResponseHandler: NSObject
{
    var dataObject : dataController!
    init(obj : dataController)
    {
        
        //getting dataController object
        dataObject = obj
    }
    
//MARK: Team Response
    
    //parse the response and send the data to the DataController
    func response(snapshot : FIRDataSnapshot)
    {
        
        //converting the response in to a array of Dictionary
        let tempArray = snapshot.value as! [NSDictionary]
        
        //Sending the data to TeamNames Data
        dataObject.teamData(tempArray)
    }
    
    //Sends the image data to Data Controller
    func responseLogoImage(data: NSData , index : Int)
    {
        
        dataObject.imageData(data , index : index)
        
    }
    
//MARK: Player Response
    
    
    //Sends the player details to the Data Controller
    func playerResponse(snapshot : FIRDataSnapshot)
    {
        
        //converting the response in to a array of Dictionary
        let tempArray = snapshot.value as! [NSDictionary]
        
        dataObject.playerData(tempArray)
        
    }
    
    //Sends the picture data to the Data Controller
    func playerProfileImage(data : NSData , index : Int) {
        
        dataObject.playerImagedata(data , index: index)
        
    }
}
