//
//  AppDelegate.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        // Override point for customization after application launch.
        let bug1:RWTScaryBugDoc = RWTScaryBugDoc(title: "Potato Bug", rating: 2, thumbImage: UIImage(named: "potatoBugThumb.jpg"), fullImage: UIImage(named: "potatoBug.jpg"))
        let bug2:RWTScaryBugDoc = RWTScaryBugDoc(title: "House Centipede", rating: 5, thumbImage: UIImage(named: "centipedeThumb.jpg"), fullImage: UIImage(named: "centipede.jpg"))
        let bug3:RWTScaryBugDoc = RWTScaryBugDoc(title: "Wolf Spider", rating: 1, thumbImage: UIImage(named: "wolfSpiderThumb.jpg"), fullImage: UIImage(named: "wolfSpider.jpg"))
        let bug4:RWTScaryBugDoc = RWTScaryBugDoc(title: "Lady Bug", rating: 0, thumbImage: UIImage(named: "ladybugThumb.jpg"), fullImage: UIImage(named: "ladybug.jpg"))
        
        var bugs:NSMutableArray = [bug1,bug2, bug3, bug4]
        
        let navController:UINavigationController = self.window!.rootViewController as UINavigationController
        let masterController:MasterViewController = navController.viewControllers[0] as MasterViewController
        masterController.bugs = bugs
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

