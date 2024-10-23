//
//  IncludedServiceDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - IncludedService

struct IncludedServiceDataModel: Codable, Sendable {
    let id: Int?
    let name, description: String?
    let imageLink: String?
}
