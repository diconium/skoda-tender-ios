//
//  Constants.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

/**
 A container for application-wide constants, organized into distinct namespaces for improved accessibility and maintainability.

 # Overview
 The `Constants` enum serves as a centralized location for constants used throughout the application. It is organized into nested enums .

 # Why Use an Enum?
 - **Uniqueness Requirement:** If your constants need to be unique, an enum is ideal because it enforces uniqueness at the type level.
 - **Namespace Without Instantiation:** A case-less enum like `Constants` prevents accidental instantiation. This ensures that `Constants` exists solely as a namespace, unlike a structure which could be instantiated, potentially creating unnecessary objects.
 - **Compile-Safety:** Attempting to instantiate this case-less enum results in a compilation error, providing additional safety against unintended usage.

 Access each constant directly via its namespace, for example, `Constants.API.baseURL`.
 */
enum Constants {
    enum API {
        static let baseURL = "http://skoda-backend-dev-lb-872235717.eu-central-1.elb.amazonaws.com/subscriptions/TMBJR0NX4RY183174/status"
    }

    enum Business {
        static let maxDaysUntilSubscriptionExpire = 30
    }

    enum Notifications {
        static let carDataUpdated = Notification.Name("carDataUpdated")
    }

    enum UI {
        static let defaultCornerRadius: CGFloat = 8.0
    }
}
