//
//  ReflectiveEquatable.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import Foundation

// MARK: - ReflectiveEquatable

protocol ReflectiveEquatable: Equatable {}

extension ReflectiveEquatable {

    var reflectedValue: String { String(reflecting: self) }

    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.reflectedValue == rhs.reflectedValue
    }
}
