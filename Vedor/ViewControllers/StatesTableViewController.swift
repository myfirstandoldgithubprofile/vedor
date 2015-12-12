//
//  StatesTableViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit

class StatesTableViewController: UITableViewController {

    let baseImageName = "ic_uf_"
    var states: [State]!
    var region: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = region
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StateCell") as? StateTableViewCell
        
        let state = states[indexPath.row]
        cell?.stateLabel.text = state.name
        cell?.imageView?.image = UIImage(named: "\(baseImageName)\(state.code.lowercaseString)")
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("RolesSegue", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = sender as! NSIndexPath
        
        let state = states[indexPath.row]
        
        let toView = segue.destinationViewController as! RolesTableViewController
        toView.state = state
        
    }
}
