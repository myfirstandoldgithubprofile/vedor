//
//  ViewController.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/11/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse


class RegionsTableViewController: UITableViewController {
    
    enum Region: String {
        case Brasil, Norte, Nordeste, CentroOeste = "Centro-Oeste", Sudeste, Sul
    }
    
    let regions = [Region.Brasil, .Norte, .Nordeste, .CentroOeste, .Sudeste, .Sul]
    var states: [State] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RegionCell")
        
        let region = regions[indexPath.row].rawValue
        cell?.textLabel?.text = region
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let region = regions[indexPath.row]
        
        switch (region) {
            
        case .Norte:
            states.append(State(name: "Acre", code: "AC"))
            states.append(State(name: "Amapá", code: "AP"))
            states.append(State(name: "Amazonas", code: "AM"))
            states.append(State(name: "Pará", code: "PA"))
            states.append(State(name: "Rondônia", code: "RO"))
            states.append(State(name: "Roraima", code: "RR"))
            states.append(State(name: "Tocantins", code: "TO"))
            
        case .Nordeste:
            states.append(State(name: "Alagoas", code: "AL"))
            states.append(State(name: "Bahia", code: "BA"))
            states.append(State(name: "Ceará", code: "CE"))
            states.append(State(name: "Maranhão", code: "MA"))
            states.append(State(name: "Paraíba", code: "PB"))
            states.append(State(name: "Pernambuco", code: "PE"))
            states.append(State(name: "Piauí", code: "PI"))
            states.append(State(name: "Rio Grande do Norte", code: "RN"))
            states.append(State(name: "Sergipe", code: "SE"))
            
        case .CentroOeste:
            states.append(State(name: "Distrito Federal", code: "DF"))
            states.append(State(name: "Goiás", code: "GO"))
            states.append(State(name: "Mato Grosso", code: "MT"))
            states.append(State(name: "Mato Grosso do Sul", code: "MS"))
            
        case .Sudeste:
            states.append(State(name: "Espírito Santo", code: "ES"))
            states.append(State(name: "Minas Gerais", code: "MG"))
            states.append(State(name: "Rio de Janeiro", code: "RJ"))
            states.append(State(name: "São Paulo", code: "SP"))
            
        case .Sul:
            states.append(State(name: "Paraná", code: "PR"))
            states.append(State(name: "Rio Grande do Sul", code: "RS"))
            states.append(State(name: "Santa Catarina", code: "SC"))
            
        case .Brasil:
            performSegueWithIdentifier("RolesSegue", sender: indexPath)
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            return
        }
        
        performSegueWithIdentifier("StatesSegue", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "StatesSegue" {
            let indexPath = sender as! NSIndexPath
            
            let region = regions[indexPath.row]
            
            let toView = segue.destinationViewController as! StatesTableViewController
            toView.states = states
            toView.region = region.rawValue
            
            states = []
        }
    }
}

