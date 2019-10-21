  //
//  ViewController.swift
//  IOS10LocalNotificationTutorial
//
//  Created by Arthur Knopper on 07/10/2016.
//  Copyright © 2016 Arthur Knopper. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate{
    
    
    var myTimer = Timer()
    var counter = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(URL(fileURLWithPath: #file).lastPathComponent,#function,#line)
        
        /* // with timer
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        */
        
        
        //        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
        //                if success {
        //                    print("success")
        //                } else {
        //                    print("error")
        //                }
        //            }
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("clicks")
        /*
        switch response.actionIdentifier {
        case "Snooze":
             print("user clicks.")
            
        case "Cancel":
             print("cancel")
            
        default:
            print("unknown action")
            
        }
   */
        completionHandler()
       
    }
    
     // with timer
    @objc func updateTimer(){
        print(URL(fileURLWithPath: #file).lastPathComponent,#function,#line,"counter: \(counter)")
        if counter > 0 {
            counter = counter - 1
            if counter == 55  {
                sendAllNotifications()
            } else if counter == 20 {
                removeAllNotifications()
            }
            
        } else {
          //  counter = 60
            myTimer.invalidate()
        }
        
    }
    
    func removeAllNotifications() {
        print(URL(fileURLWithPath: #file).lastPathComponent,#function,#line)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
    }
    
    func sendAllNotifications() {
        print(URL(fileURLWithPath: #file).lastPathComponent,#function,#line)
        for i in 1...60 {
            //  print(i)
            var content = UNMutableNotificationContent()
            content.title = "Notification Tutorial"
            content.subtitle = "from ioscreator.com"
            content.body = " Notification triggered"+String(i)
            
            
            var request = UNNotificationRequest(identifier: "note.id" + String(i), content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5 * i), repeats: false))
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        
    }
   
   
    @IBAction func removeNotification(_ sender: Any) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
      //  UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification.id.01"])
        // ^ originally added above function to AppDelegate's "applicationWillTerminate()" but was not called. Why ???
        
    }
    
    
    @IBAction func sendNotification(_ sender: AnyObject) {
        
        /*  // Barebone version-----------------------------------

        // 1 The UNMutableNOtificationContent object contains the data of the notification
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from ioscreator.com"
        content.body = " Notification triggered"
        //content.badge = 2
        //content.sound = UNNotificationSound.default()
 
        
   
        //>-----------------------------------------------------------------------
        // TODO: try out notificaion category and notification action.
        // - Custom Actions
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let cancelAction = UNNotificationAction(identifier: "Cancel", title: "Cancel", options: [])
        let category = UNNotificationCategory(identifier: "SnoozeCategory", actions: [snoozeAction, cancelAction], intentIdentifiers: [], options: [])
        
        content.categoryIdentifier = "SnoozeCategory"
        UNUserNotificationCenter.current().setNotificationCategories([category])
        //<-------------------------------------------------------------------------
 
   
        // 2 The UNNotificationAttachment object contains the media content of the notification
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }

        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)

        content.attachments = [attachment]
        
   
        
        // this is replaced with the loop
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
        */   // barebone version----------------------------------------
        
        
        // TODO: use loop to deliver multiple notifications.
        // loop version----------------------------------------------
        for i in 1...60 {
           // print(i)
            var content = UNMutableNotificationContent()
            content.title = "Notification Tutorial"
            content.subtitle = "from ioscreator.com"
            content.body = " Notification triggered"+String(i)
          //  content.sound = UNNotificationSound.default
            
            /*
            //>-----------------------------------------------------------------------
            // TODO: try out notificaion category and notification action.
            // - Custom Actions
            let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
            let cancelAction = UNNotificationAction(identifier: "Cancel", title: "Cancel", options: [])
            let category = UNNotificationCategory(identifier: "SnoozeCategory", actions: [snoozeAction, cancelAction], intentIdentifiers: [], options: [])
            
            content.categoryIdentifier = "SnoozeCategory"
            UNUserNotificationCenter.current().setNotificationCategories([category])
            //<-------------------------------------------------------------------------
            */
            
            var request = UNNotificationRequest(identifier: "note.id" + String(i), content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5 * i), repeats: false))
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        // loop version-------------------------------------------
        
        
        
        
        // TODO: use uuid to automatically generate identifier
        
        
        // TODO: try out immediate fire trigger without timeInterval
        
        
        // TODO: trigger notifications when data comes in and app in the background.
        // TODO: Try out when receive notification in the foreground. use delegate.
        // TODO: scheduling timer to automatically send notifications and remove notifications in the background
        
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

