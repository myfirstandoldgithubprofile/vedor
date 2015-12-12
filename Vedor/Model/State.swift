//
//  Estado.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit

class State: NSObject {
    
    var name: String!
    var code: String!
    
    init (name: String?, code: String?) {
        
        self.name = name
        self.code = code
    }

}
