//
//  DuoDemoAppApp.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/2024.
//

import Foundation
import SwiftUI

@main
struct DuoDemoAppApp: App {

    let center = UNUserNotificationCenter.current()

    init() {
        registerForNotification()
    }

    func registerForNotification() {
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { _, error in
            if error != nil { UIApplication.shared.registerForRemoteNotifications() } else {}
        })
    }

    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.1, *) {
                ContentView().onOpenURL { url in
                    guard let url = URLComponents(string: url.absoluteString) else { return }
                    if let courierNumber = url.queryItems?.first(where: { $0.name == "CourierNumber" })?.value {
                        // call courier
                    }
                }
            }
        }
    }
}
