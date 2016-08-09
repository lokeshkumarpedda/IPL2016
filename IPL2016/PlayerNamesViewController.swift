//
//  PlayerNamesViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 08/08/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerNamesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var playerNameViewModelObject : PlayerNamesViewModel!
    var teamNameViewControllerObject : TeamNamesViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerNameViewModelObject = PlayerNamesViewModel(obj : self)
        
        playerNameViewModelObject.getData(teamNameViewControllerObject.selectedTeam!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //number of rows for table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return playerNameViewModelObject.numberOfRows()
    }
    
    //Each cell for tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = playerNameViewModelObject.playerName(indexPath.row)
        
        cell.imageView?.image = playerNameViewModelObject.profileImage(indexPath.row)
        
        return cell
    }
    
    //Reloading the tableview when the data comes from the server
    func reload() {
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
