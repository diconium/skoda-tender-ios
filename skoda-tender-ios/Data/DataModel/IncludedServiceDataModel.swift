//
//  IncludedServiceDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - IncludedServiceDataModel

/// A model representing an included service with its details.
struct IncludedServiceDataModel: Codable, Sendable {
    let id: Int
    let name: String
    let description: String?
    let imageLink: String?
}
