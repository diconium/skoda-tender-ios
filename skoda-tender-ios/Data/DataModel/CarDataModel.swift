//
//  CarDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - CarDataModel

struct CarDataModel: Codable, Sendable {
  
    let vin: String
    let brand: String
    let model: String
    let year: Int
}
