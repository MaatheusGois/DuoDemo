//
//  DuoDemoAppAttributes.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/2024.
//

import ActivityKit
import SwiftUI

struct DuoDemoAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState

    public struct ContentState: Codable, Hashable {
        let currentLesson: CGFloat
        let numberOfLessons: CGFloat
        let initialTime: Date

        var progress: CGFloat {
            currentLesson / numberOfLessons
        }

        var progressString: String {
            String(Int(currentLesson / numberOfLessons * 100))
        }

        var currentLessonString: String {
            String(Int(currentLesson))
        }

        var numberOfLessonsString: String {
            String(Int(numberOfLessons))
        }
    }

    let flow: DeepLink
    let id = UUID()
}
