//
//  Constants.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

enum Constants {
    enum API {
        static let baseURL = "http://skoda-services-dev-1394477866.eu-central-1.elb.amazonaws.com/subscriptions/TMBJR0NX4RY183174/status"
    }

    enum Notifications {
        static let carDataUpdated = Notification.Name("carDataUpdated")
    }

    enum UI {
        static let defaultCornerRadius: CGFloat = 8.0
    }
}
