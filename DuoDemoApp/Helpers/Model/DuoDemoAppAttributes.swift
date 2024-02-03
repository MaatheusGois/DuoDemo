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
        var currentLesson: CGFloat
        var numberOfLessons: CGFloat
        var initialTime: Date

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

    var id = UUID()
}
