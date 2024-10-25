//
//  StatusDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Alamofire

// MARK: - StatusDataModel

/// A data model representing the status of a car, including its associated car data and subscriptions.
struct StatusDataModel: Codable, Sendable {
    let user: UserDataModel
    let car: CarDataModel?
    let subscriptions: [SubscriptionDataModel]?
}
