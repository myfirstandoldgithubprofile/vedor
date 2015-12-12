//
//  AppDelegate.swift
//  Vedor
//
//  Created by Jaison Vieira on 12/11/15.
//  Copyright © 2015 hackpuck. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var user: PFUser?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        Parse.setApplicationId("YyVUOooeUmORbVk7iP8W6qtpif4NDpLeD4BVBDag",
            clientKey: "td6YRtXiicaU6nTaRt4oOCcvJcNkFtcsrmUWWWeQ")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {
 
    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

