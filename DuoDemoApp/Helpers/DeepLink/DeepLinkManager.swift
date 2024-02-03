//
//  DeepLink.swift
//  DuoDemoApp
//
//  Created by Matheus Gois on 03/02/24.
//

import Foundation

struct DeepLinkManager {
    static func managerDeepLink(with url: URL) {
        guard let url = URLComponents(string: url.absoluteString) else { return }

        if let flow = url.queryItems?.first(where: { $0.name == DeepLink.param })?.value {
            switch DeepLink(rawValue: flow) {
            case .home:
                print("Open Home")
            case .details:
                print("Open Details")
            case .none:
                print("Deeplink not found")
            }
        } else {
            print("Query Items not found")
        }
    }
}
