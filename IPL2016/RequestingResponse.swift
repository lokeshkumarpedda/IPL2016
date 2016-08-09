//
//  RequestingResponse.swift
//  IPL2016
//

//Purpose : Making a request to the firebase and retrieveing data

//  Created by BridgeLabz on 05/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class RequestingResponse: NSObject
{
    var tn : dataController!
    var rr : ResponseHandler
    init(obj : dataController)
    {
        //Taking dataController reference
        tn = obj
        rr = ResponseHandler(obj: tn)
    }
    
    
    func request(path : String)
    {
        //getting firebase database reference
        let ref = FIRDatabase.database().reference()
        
        //getting particular child data
        ref.child(path).observeEventType(.Value, withBlock: { (snapshot) in
            
            //calling the response handler class with the response
            self.rr.response(snapshot)
        })
    }
    
    func requestImage(path : String , index : Int)
    {
        //getting firebase storage reference
        let ref = FIRStorage.storage().reference()
        
        //getting image data with maximum 1 MB
        ref.child(path).dataWithMaxSize(1*10254*1024) { (data,error) -> Void in
            if error != nil
            {
                print("Network Error")
            }
            else
            {
                //calling the response handler class with the response
                self.rr.responseLogoImage(data! , index: index)
            }
        }
    }
    
    
    func player(path : String)
    {
        //getting firebase database reference
        let ref = FIRDatabase.database().reference()
        
        //getting particular child data
        ref.child(path).observeEventType(.Value, withBlock: { (snapshot) in
            
            //calling the response handler class with the response
            self.rr.playerResponse(snapshot)
        })
    }
    
    func requestPlayerImage(path: String , index : Int) {
        //getting firebase storage reference
        let ref = FIRStorage.storage().reference()
        //getting image data with maximum 1 MB
        ref.child(path).dataWithMaxSize(1*10254*1024) { (data,error) -> Void in
            if data == nil
            {
                print("Network Error")
            }
            else
            {
                //calling the response handler class with the response
                self.rr.playerProfileImage(data! , index: index)
            }
        }
    }
}
