//
//  SubscriptionDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//


// MARK: - SubscriptionDataModel

/// A model representing a subscription with its details.
struct SubscriptionDataModel: Codable, Sendable {
    let id: Int
    let name: String
    let description: String?
    let imageLink: String?
    let length: Int
    let price: Double
    let includedServices: [IncludedServiceDataModel]?
    let status: String
    let startDate: String
    let endDate: String?
}
