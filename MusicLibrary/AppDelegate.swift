//
//  AppDelegate.swift
//  MusicLibrary
//
//  Created by Fachri Work on 12/7/17.
//  Copyright © 2017 Decadev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: State Restoration Opt-In
    /*
     Unless these methods return YES, the application's state is not saved/restored, no
     matter what you do elsewhere. Consider it a global switch.
     You might want to return `false` conditionally in application(_:shouldRestoreApplicationState:)
     after app updates that include changes to the view (controller) hierarchy and other, potentially
     restoration-breaking changes.
     Returning `true` in application(_:shouldSaveApplicationState:) will create a restoration
     archive ("data.data") which you can inspect using the `restorationArchiveTool` provided by Apple:
     https://developer.apple.com/downloads/ (Login required; search for "restoration")
     Opting into state restoration will also take a snapshot of your app when entering
     background mode.
     While this generally switches on restoration, it doesn't do much yet: Individual
     controllers, views, and other participating objects must implement basic saving/
     restoration mechanisms in order for anything to actually restore. This can be
     done in code, or with the help of Storyboards. This demo focusses on code.
     
     General debugging tips:
     To get the app to restore in the simulator, follow these steps:
     - send the app to the background (home button / cmd + h)
     - quit the app in Xcode
     - relaunch the app
     
     Do not force-quit the app in the app switcher - this deletes the restoration archive.
     Do not kill the app while still in the foreground, as the restoration archive is created
     when the app goes into the background. To debug state restoration on device, read the
     documentation provided with the `restorationArchiveTool` mentioned above.
     */
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        let lib = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Saved Application State")
        print("Restoration files: \(lib)")
        
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }


}

