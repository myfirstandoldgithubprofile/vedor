//
//  RolesTableViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class RolesTableViewController: UITableViewController {
    
    enum Role: String {
        case PrimeiroSuplente = "1º SUPLENTE", SegundoSuplente = "2º SUPLENTE",
        DeputadoDistrital = "DEPUTADO DISTRITAL", DeputadoEstadual = "DEPUTADO ESTADUAL",
        DeputadoFederal = "DEPUTADO FEDERAL", Governador = "GOVERNADOR", Presidente = "PRESIDENTE",
        Senador = "SENADOR", ViceGovernador = "VICE-GOVERNADOR", VicePresidente = "VICE-PRESIDENTE"
    }

    var roles:[Role]!
    var state: State?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cargos"
        
        if state == nil {
            roles = [Role.Presidente, .VicePresidente]
        } else if state?.code == "DF" {
            roles = [Role.PrimeiroSuplente, .SegundoSuplente, .DeputadoDistrital,
                .DeputadoFederal, .Governador, .ViceGovernador, .Senador]
        } else {
            roles = [Role.PrimeiroSuplente, .SegundoSuplente, .DeputadoEstadual,
                .DeputadoFederal, .Governador, .ViceGovernador, .Senador]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RoleCell")
        
        let role = roles[indexPath.row].rawValue.capitalizedString
        cell?.textLabel?.text = role
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let role = roles[indexPath.row].rawValue
        
        let request = ParseManager.parseCreator("politics")
        request.addWhere(Politician.ParseField.PoliticianRole.rawValue, equalTo: role)
        
        if  let tmpstate = state {
            request.addWhere(Politician.ParseField.PoliticianUf.rawValue, equalTo: tmpstate.code)
        }
        
        request.doRequest { (parseObjects) -> () in
            
            if parseObjects != nil {
                self.performSegueWithIdentifier("CandidatesSegue", sender: parseObjects)
            } else {
                // TODO display error
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let parseObjects = sender as! [PFObject]
        
        let toView = segue.destinationViewController as! CanditatesTableViewController
        toView.candidates = parseObjects
    }
}
