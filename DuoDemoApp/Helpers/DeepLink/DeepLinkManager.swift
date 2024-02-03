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
        if let courierNumber = url.queryItems?.first(where: { $0.name == "CourierNumber" })?.value {
            // call courier
        }
    }
}

