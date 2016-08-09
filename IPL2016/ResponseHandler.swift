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
    
    func response(snapshot : FIRDataSnapshot)
    {
        //converting the response in to a array of Dictionary
        let tempArray = snapshot.value as! [NSDictionary]
        
        //Sending the data to TeamNames Data
        dataObject.teamData(tempArray)
    }
    
    func responseLogoImage(data: NSData , index : Int)
    {
        dataObject.imageData(data , index : index)
    }
    
    func playerResponse(snapshot : FIRDataSnapshot)
    {
        //converting the response in to a array of Dictionary
        let tempArray = snapshot.value as! [NSDictionary]
        dataObject.playerData(tempArray)
    }
    
    func playerProfileImage(data : NSData , index : Int) {
        dataObject.playerImagedata(data , index: index)
    }
}
