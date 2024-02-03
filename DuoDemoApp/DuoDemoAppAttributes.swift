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
        var courierName: String
        var deliveryTime: Date
    }

    var numberOfGroceyItems: Int
    var id = UUID()
}
