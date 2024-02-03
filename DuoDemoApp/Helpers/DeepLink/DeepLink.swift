//
//  DeepLink.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import Foundation

enum DeepLink: ReflectiveEquatable {

    static var path: String = Bundle.main.bundleURL.absoluteString

    case home(number: Int)

    var url: String {
        switch self {
        case .home(let number):
            return "\(Self.path)://?number=\(number)"
        }
    }
}
