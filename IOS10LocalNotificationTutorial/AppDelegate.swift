//
//  AppDelegate.swift
//  IOS10LocalNotificationTutorial
//
//  Created by Arthur Knopper on 07/10/2016.
//  Copyright © 2016 Arthur Knopper. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    func scheduleNotifications () {
//        // 1 The UNMutableNOtificationContent object contains the data of the notification
//        let content = UNMutableNotificationContent()
//        content.title = "Notification Tutorial"
//        content.subtitle = "from ioscreator.com"
//        content.body = " Notification triggered"
//        //content.badge = 2
//        //content.sound = UNNotificationSound.default()
//
//        // 2 The UNNotificationAttachment object contains the media content of the notification
//        let imageName = "applelogo"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
//
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//
//        content.attachments = [attachment]
//
//        // 3 create a trigger; specify the condition of delivery
//        // case 1: non-repeat trigger
//        //   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        // case 2: repeat trigger
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
//
//        // 4 create a request with the trigger and the content
//        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
//
//        // 5 schedule the request with the system
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
     //   scheduleNotifications()
    
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
        
//    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification.id.01"])
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        // ^ above code does not work. Why?
        print("\(URL(fileURLWithPath: #file).lastPathComponent,#function,#line)- ")
        
    }


}

