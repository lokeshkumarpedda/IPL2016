//
//  TeamNamesViewModel.swift
//  IPL2016
//

//Purpose : get the team data from the DataController and send it to the view controller when requested

//  Created by BridgeLabz on 06/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamNamesViewModel: NSObject
{
    //creating references
    var teamData : dataController!
    var teamViewController : TeamNamesViewController!
    
    //taking a empty dictionary array for storing the team data array
    var dataArray = [NSDictionary]()
    
    //image array to store the logo images
    var logoImageArray = [UIImage]()
    
    //constructor for getting view controller object and datacontroller object
    init(obj : TeamNamesViewController)
    {
        super.init()
        teamViewController = obj
        teamData = dataController(obj: self)
    }
    
    
//MARK: Requesting Data
    
    //Asking DataController for Data
    func getData()
    {
        
        teamData.makeRequest("teams")
        
    }
    
    //Getting the data and storing it
    func updateDataArray(tempArray : [NSDictionary])
    {
        
        dataArray = tempArray
        
        //Adding dummy images to the array
        for _ in 0..<tempArray.count
        {
            logoImageArray.append(UIImage(named: "logoDummy")!)
        }
        
        //for realoading the tableview with the data
        self.update()
        
    }
    
    //when get the image from server it will reload the table view with that image
    func logoImageData(image : UIImage , index : Int)
    {
        
        //Adding the image to the image array
        logoImageArray[index] = image
        self.update()
        
    }
    
    //For reloading the tableview
    func update(){
        
        teamViewController.reload()
        
    }
    
    
    
//MARK: Sending to viewcontroller
    
    //returns the total teams number
    func numberOfRows() -> Int
    {
        
        return dataArray.count
        
    }
    
    
    //returns the particulat team name requested
    func teamName(index : Int) -> String
    {
        
        return dataArray[index].valueForKey("team_name") as! String
        
    }
    
    //returns the particular image requested
    func logoImage(index : Int) -> UIImage
    {
        
        return logoImageArray[index]
        
    }

}
