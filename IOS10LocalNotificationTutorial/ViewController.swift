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
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
      //  UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification.id.01"])
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
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 25, repeats: false)
        let trigger3 = UNTimeIntervalNotificationTrigger(timeInterval: 35, repeats: false)
        let trigger4 = UNTimeIntervalNotificationTrigger(timeInterval: 45, repeats: false)
        // case 2: repeat trigger
     //   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

        // 4 create a request with the trigger and the content
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        let request1 = UNNotificationRequest(identifier: "notification.id.02", content: content, trigger: trigger1)
        let request2 = UNNotificationRequest(identifier: "notification.id.03", content: content, trigger: trigger2)
        let request3 = UNNotificationRequest(identifier: "notification.id.04", content: content, trigger: trigger3)
        let request4 = UNNotificationRequest(identifier: "notification.id.05", content: content, trigger: trigger4)
        // 5 schedule the request with the system
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        UNUserNotificationCenter.current().add(request1, withCompletionHandler: nil)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
        UNUserNotificationCenter.current().add(request3, withCompletionHandler: nil)
        UNUserNotificationCenter.current().add(request4, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        var myTimer = Timer()
//        myTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: <#T##Selector#>, userInfo: nil, repeats: true)
        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
//                if success {
//                    print("success")
//                } else {
//                    print("error")
//                }
//            }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

