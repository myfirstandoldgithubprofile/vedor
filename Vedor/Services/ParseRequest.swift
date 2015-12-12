//
//  ParseRequest.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

class ParseRequest: NSObject {
    
    var query: PFQuery!

    init(classToRequest: String) {
        query = PFQuery(className:classToRequest)
        query.limit = 1000
    }
    
    func addWhere(key: String, equalTo: String) -> ParseRequest {
        query.whereKey(key, equalTo:equalTo)
        return self
    }
    
    func addWhereDoesNotExist(key: String) -> ParseRequest {
        query.whereKeyDoesNotExist(key)
        return self
    }

    func addWhereExists(key: String) -> ParseRequest {
        query.whereKeyExists(key)
        return self
    }

    func addWhere(key: String, prefix: String) -> ParseRequest {
        query.whereKey(key, hasPrefix: prefix)
        return self
    }
    
    func doRequest(response: (parseObjects: [PFObject]?) -> ()) {
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // get objects
                if let objects = objects {
                    response(parseObjects: objects)
                }
                
            } else {
                response(parseObjects: nil)
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
}
