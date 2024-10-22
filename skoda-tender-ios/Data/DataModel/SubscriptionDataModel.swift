//
//  Subscription.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - Subscription
struct SubscriptionDataModel: Codable, Sendable {

    let id: Int?
    let name, description: String?
    let imageLink: String?
    let length: Int?
    let price: Double?
    let includedServices: [IncludedServiceDataModel]?
    let status, startDate, endDate: String?
}




