//
//  DeepLink.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import Foundation

enum DeepLink: String, Codable {
    case home
    case details

    static let path: String = "com.maatheusgois.duo.demo"
    static let param: String = "flow"

    var url: String {
        "\(Self.path)://?\(Self.param)=\(rawValue)"
    }
}
