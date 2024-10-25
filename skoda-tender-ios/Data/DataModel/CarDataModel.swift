//
//  CarDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - CarDataModel

/// A model representing car data with vehicle identification number, brand, model, and year.
struct CarDataModel: Codable, Sendable {
    let vin: String
    let brand: String
    let model: String
    let year: Int
}
