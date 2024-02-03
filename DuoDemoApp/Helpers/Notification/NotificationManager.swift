//
//  NotificationManager.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import UserNotifications
import UIKit

struct NotificationManager {
    static var status: State = .disable

    static func registerForNotification() {
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { _, error in
            if error == nil {
                status = .enable
            } else {
                status = .disable
                UIApplication.shared.registerForRemoteNotifications()
            }
        })
    }
}

extension NotificationManager {
    enum State {
        case enable
        case disable
    }
}
