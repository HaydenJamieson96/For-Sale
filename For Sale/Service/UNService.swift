//
//  UNService.swift
//  For Sale
//
//  Created by Hayden Jamieson on 01/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit
import UserNotifications

class UNService: NSObject {
    
    private override init() {}
    
    static let shared = UNService()
    let unCenter = UNUserNotificationCenter.current()
    
    func authorize() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No UN Auth error")
            guard granted else {return}
            //above done async so need to switch back to the main thread
            DispatchQueue.main.async {
                self.configure()
            }
        }
        
    }
    
    func configure() {
        unCenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
    
}

extension UNService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN did receive")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN will present")
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}
