//
//  CanditatesTableViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class CanditatesTableViewController: UITableViewController {
    
    var candidates: [PFObject]!
    let baseImageName = "ic_pt_"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Candidatos"
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        print(appDelegate.user?.email)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("CandidateCell")
//        
//        let candidate = Politician(parseObject: candidates[indexPath.row])
//        cell?.textLabel?.text = candidate.candidateName
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CandidateCell") as? CandidateTableViewCell
        
        let candidate = Politician(parseObject: candidates[indexPath.row])
        cell?.nameLabel.text = candidate.candidateUrnName
        cell?.numberInitialsLabel.text = "\(candidate.candidatePartyNumber) - \(candidate.candidatePartyInitials)"
        cell?.statusLabel.text = candidate.candidateTurnDescription
        cell?.partyFlagImageView?.image = UIImage(named: "\(baseImageName)\(candidate.candidatePartyInitials.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: ""))")
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("CandidateSegue", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indexPath = sender as! NSIndexPath
        
        let candidate = candidates[indexPath.row]
        
        let toView = segue.destinationViewController as! CandidateDetailViewController
        toView.candidate = Politician(parseObject: candidate)
    }

}
