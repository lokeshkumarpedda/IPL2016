//
//  TeamNamesViewModel.swift
//  IPL2016
//
//  Created by BridgeLabz on 06/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamNamesViewModel: NSObject , TeamNamesProtocol
{
    var teamData : dataController!
    var teamViewController : TeamNamesViewController!
    var dataArray = [NSDictionary]()
    var logoImageArray = [UIImage]()
    init(obj : TeamNamesViewController)
    {
        super.init()
        teamViewController = obj
        teamData = dataController(obj: self)
    }
    
    
    
    func getData() {
        teamData.makeRequest("teams")
    }
    
    func updateDataArray(tempArray : [NSDictionary]){
        dataArray = tempArray
        for _ in 0..<tempArray.count
        {
            logoImageArray.append(UIImage(named: "logoDummy")!)
        }
        self.update()
    }
    
    func logoImageData(image : UIImage , index : Int)
    {
        logoImageArray[index] = image
        self.update()
    }
    
    func update(){
        teamViewController.reload()
    }
    
    func numberOfRows() -> Int
    {
        return dataArray.count
    }
    
    func teamName(index : Int) -> String
    {
        return dataArray[index].valueForKey("team_name") as! String
    }
    
    func logoImage(index : Int) -> UIImage
    {
        return logoImageArray[index]
    }

}
