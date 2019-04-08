//
//  ViewController.swift
//  IOS10LocalNotificationTutorial
//
//  Created by Arthur Knopper on 07/10/2016.
//  Copyright © 2016 Arthur Knopper. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBAction func removeNotification(_ sender: Any) {
      //  UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification.id.01"])
        // ^ originally added above function to AppDelegate's "applicationWillTerminate()" but was not called. Why ???
        
    }
    @IBAction func sendNotification(_ sender: AnyObject) {
        // 1 The UNMutableNOtificationContent object contains the data of the notification
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from ioscreator.com"
        content.body = " Notification triggered"
        //content.badge = 2
        //content.sound = UNNotificationSound.default()
        
        // 2 The UNNotificationAttachment object contains the media content of the notification
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        
        // 3 create a trigger; specify the condition of delivery
        // case 1: non-repeat trigger
     //   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        // case 2: repeat trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        // 4 create a request with the trigger and the content
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 5 schedule the request with the system
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        var myTimer = Timer()
//        myTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: <#T##Selector#>, userInfo: nil, repeats: true)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                if success {
                    print("success")
                } else {
                    print("error")
                }
            }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

