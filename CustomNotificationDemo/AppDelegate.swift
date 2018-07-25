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
        winguLocations.apiKey = <# API Key #>
        winguLocations.delegate = self
        winguLocations.returnOnlyChanelsWithContent = true
        NotificationsManager.shared.shouldSendWinguNotifications = false
        return winguLocations
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        winguLocations.start()
        return true
    }
}

// MARK: - WinguLocationsDelegate
extension AppDelegate: WinguLocationsDelegate {
    func winguChannels(_ channels: [Channel]) {
        self.notification(from: channels.last)
    }
}

// MARK: - Notifications
extension AppDelegate {
    func notification(from channel: Channel?) {
        guard let beacon = channel as? Beacon else {
            print("other trigger than beacon found \(channel.debugDescription)")
            return
        }
        let notification = UNMutableNotificationContent()
        notification.title = beacon.content?.pack?.deck?.title ?? "unknown deck title"
        let actionComponent = beacon.content?.pack?.deck?.cards?.last as? ActionComponent
        notification.subtitle = actionComponent?.payload ?? "unknown url"
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
