//
//  ActivityManager.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import ActivityKit
import SwiftUI

class ActivityManager: ObservableObject {
    @Published var activities = Activity<DuoDemoAppAttributes>.activities

    func createActivity() {
        guard NotificationManager.status == .enable else {
            // Handle error
            return
        }

        let attributes = DuoDemoAppAttributes(numberOfGroceyItems: 12)
        let contentState = DuoDemoAppAttributes.LiveDeliveryData(courierName: "", percentage: 0.3)
        do {
            _ = try Activity<DuoDemoAppAttributes>.request(
                attributes: attributes,
                contentState: contentState,
                pushType: .token
            )
        } catch {
            print(error.localizedDescription)
        }
    }

    func update(activity: Activity<DuoDemoAppAttributes>) {
        Task {
            let updatedStatus = DuoDemoAppAttributes.LiveDeliveryData(
                courierName: "",
                percentage: 0.5
            )
            await activity.update(using: updatedStatus)
        }
    }

    func end(activity: Activity<DuoDemoAppAttributes>) {
        Task {
            await activity.end(dismissalPolicy: .immediate)
        }
    }

    func endAllActivity() {
        Task {
            for activity in Activity<DuoDemoAppAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }

    func listAllDeliveries() {
        var activities = Activity<DuoDemoAppAttributes>.activities
        activities.sort { $0.id > $1.id }
        self.activities = activities
    }
}
