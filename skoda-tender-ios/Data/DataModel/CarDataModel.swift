//
//  CarDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - CarTest
struct CarDataModel: Codable, Sendable {

    let vin, brand, model: String?
    let year: Int?
}
