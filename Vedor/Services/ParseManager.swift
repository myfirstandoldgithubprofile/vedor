//
//  ParseManager.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/12/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit

class ParseManager: NSObject {
    
    static func parseCreator(classToRequest: String) -> ParseRequest {
        return ParseRequest(classToRequest: classToRequest);
    }

}
