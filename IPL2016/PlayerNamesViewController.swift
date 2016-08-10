//
//  PlayerNamesViewController.swift
//  IPL2016
//

//Purpose: For displaying player names and images

//  Created by BridgeLabz on 08/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerNamesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    //creating tableview outlet
    @IBOutlet weak var tableView: UITableView!
    
    var playerNameViewModelObject : PlayerNamesViewModel!
    var teamNameViewControllerObject : TeamNamesViewController!
    
    //storing which player is selected based on the index
    var selectedPlayer : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameViewModelObject = PlayerNamesViewModel(obj : self)
        
        //Getting player information
        playerNameViewModelObject.getData(teamNameViewControllerObject.selectedTeam!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//MARK: Tableview methods
    
    //number of rows for table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return playerNameViewModelObject.numberOfRows()
        
    }
    
    //Each cell for tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        //displaying player name
        cell.textLabel?.text = playerNameViewModelObject.playerName(indexPath.row)
        
        //for displaying player picture
        cell.imageView?.image = playerNameViewModelObject.profileImage(indexPath.row)
        
        return cell
    }
    
    //For knowing which player is selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        selectedPlayer = indexPath.row
        
    }
    
    //sending the self object to the next view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        //checking for the paticular segue
        if segue.identifier == "playerInformation"
        {
            let temp = segue.destinationViewController as! PlayerInformationViewController
            temp.playerNamesVCObject = self
        }
    }
    

    
    
    //Reloading the tableview when the data comes from the server
    func reload()
    {
        
        tableView.reloadData()
        
    }
    
    //getting player information
    func playerInfo() -> NSObject?{
        
        return playerNameViewModelObject.creatingModel(selectedPlayer!)
        
    }

}
