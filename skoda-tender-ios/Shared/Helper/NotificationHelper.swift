//
//  NotificationHelper.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 24/10/2024.
//

import Foundation
import UserNotifications

class NotificationHelper {
    public static func showUserNotification(title: String, message: String = String()) {
        let center = UNUserNotificationCenter.current()
        center.getDeliveredNotifications { notificationList in

            let titleList = notificationList.compactMap { $0.request.content.title }
//            if !titleList.contains(title) { // only add if it's not already notified
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = message
                content.categoryIdentifier = "alarm"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
//            }
        }
    }
}
