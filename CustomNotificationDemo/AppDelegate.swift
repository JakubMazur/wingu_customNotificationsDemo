//
//  AppDelegate.swift
//  CustomNotificationDemo
//
//  Created by Jakub Mazur on 25/07/2018.
//  Copyright © 2018 wingu GmbH. All rights reserved.
//

import UIKit
import winguSDKEssential
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var winguLocations: WinguLocations = {
        let winguLocations: WinguLocations = WinguLocations.shared
        winguLocations.apiKey = <#Your API Key#>
        winguLocations.delegate = self
        winguLocations.returnOnlyChanelsWithContent = true // if you're interest of content of the trigger, not only trigger parameters
        NotificationsManager.shared.shouldSendWinguNotifications = false // if case requires custom action
        NotificationsManager.shared.onlyNotificationsWithContentUpdate = false //
        winguLocations.beaconScanner.rediscoverNotificationTime = 120 // notification will be triggered every 2 minutes for a content in range in case of exit/enter event
        return winguLocations
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuth(options: [.alert,.sound]) { (_, _) in
            //error checking
        }
        winguLocations.start()
        return true
    }
}

// MARK: - WinguLocationsDelegate
extension AppDelegate: WinguLocationsDelegate {
    func winguChannels(_ channels: [Channel]) {
        // of course with this implementation app will trigger notifications for every beacons currently in range.
        // you should trigger notification only for new content in range
        for channel in channels {
            self.notification(from: channel)
        }
    }
}

// MARK: - Overriden notifications behaviour
extension AppDelegate {
    func notification(from channel: Channel?) {
        let notification = UNMutableNotificationContent()
        notification.title = channel?.content?.pack?.deck?.title ?? "unknown deck title"
        notification.subtitle = String(channel?.content?.pack?.deck?.cards?.count ?? -1)
        notification.body = channel?.content?.pack?.deck?.cards?.compactMap { $0.component?.discriminator }.joined() ?? "unknown component state"
        notification.sound = UNNotificationSound.default()
        notification.categoryIdentifier = "wingu_notification"
        if let encodedChannel = channel?.encode() {
            notification.userInfo = ["channel": encodedChannel]
        }
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false) // 2 sec delay
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print(error.debugDescription)
            }
        }
        UNUserNotificationCenter.current().delegate = self
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let channelData = response.notification.request.content.userInfo["channel"] as? Data
        let channel = Channel.decode(from: channelData)
        print(channel?.content?.pack?.deck?.uID) //check is deck is fillup in user info
        completionHandler()
    }
}
