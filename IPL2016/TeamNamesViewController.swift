//
//  ViewController.swift
//  IPL2016
//
//Purpose : Displaying all the team Names with there logos


//  Created by BridgeLabz on 01/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class TeamNamesViewController: UIViewController  ,UITableViewDelegate , UITableViewDataSource
{
    //creating table outlet
    @IBOutlet weak var tableView: UITableView!
    var selectedTeam : String?
    var TeamViewModelObject : TeamNamesViewModel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TeamViewModelObject = TeamNamesViewModel(obj: self)
        
        //Calling Firebase for team data
        TeamViewModelObject.getData()
       

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //number of rows for table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TeamViewModelObject.numberOfRows()
    }
    
    
    //Each cell for tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = TeamViewModelObject.teamName(indexPath.row)
        
        cell.imageView?.image = TeamViewModelObject.logoImage(indexPath.row)
 
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedTeam = TeamViewModelObject.teamName(indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playerSegue"
        {
            let temp = segue.destinationViewController as! PlayerNamesViewController
            temp.teamNameViewControllerObject = self
        }
    }
    //Reloading the tableview when the data comes from the server
    func reload() {
        tableView.reloadData()
    }
}
