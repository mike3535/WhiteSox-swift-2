//
//  AppDelegate.swift
//  WhiteSox
//
//  Created by Mike Rizza on 11/3/15.
//  Copyright (c) 2015 Mike Rizza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //get pList
        let path = NSBundle.mainBundle().pathForResource("Chicago White Sox", ofType: "plist")
        let array = NSArray(contentsOfFile: path!) as! [AnyObject]
        
        
        let navigationController = self.window!.rootViewController as! UINavigationController
        let mainController = navigationController.childViewControllers[0] as! PlayerListViewController
        
        var player: Player
        
        for dict in array {
            let number = dict["Number"]
            let firstName = dict["First Name"]
            let lastName = dict["Last Name"]
            let pos = dict["Position"]
            let bats = dict["Bats"]
            let hand = dict["Throws"]
            let height = dict["Height"]
            let weight = dict["Weight"]
            let birthDate = dict["DOB"]
            
            
            player = Player()
            player.number = number as! String
            player.firstName = firstName as! String
            player.lastName = lastName as! String
            player.pos = pos as! String
            player.bats = bats as! String
            player.hand = hand as! String
            player.height = height as! String
            player.weight = weight as! String
            player.birthDate = birthDate as! String
            
            
            mainController.objects.append(player)
        }
        
       
        
    
        
        //var sortedArray = sorted(mainController.objects){$0.lastName < $1.lastName}// -> Bool in
        //   return o1.lastName == o2.lastName ? (o1.firstName < o2.firstName) : (o1.lastName < o2.lastName)})
        
        
      
        //sort UITable
           mainController.objects.sortInPlace({ $0.lastName < $1.lastName })
       
        
        //reload sorted data
        dispatch_async(dispatch_get_main_queue()) {
            (mainController.view as! UITableView).reloadData()
        }
        
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

