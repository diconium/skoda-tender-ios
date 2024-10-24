//
//  Constants.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "http://18.156.191.202:8080/subscriptions/TMBJR0NX4RY183174/status"
    }

    struct Notifications {
        static let carDataUpdated = Notification.Name("carDataUpdated")
    }

    struct UI {
        static let defaultCornerRadius: CGFloat = 8.0
    }
}
