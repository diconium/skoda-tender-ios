//
//  CarModel.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

@Model
final class CarModel {

    var id: Int
    var vin: String
    var brand: String
    var model: String
    var year: Int
    var text: String

    init(id: Int, vin: String, brand: String, model: String, year: Int, text: String) {
        self.id = id
        self.vin = vin
        self.brand = brand
        self.model = model
        self.year = year
        self.text = text
    }

    convenience init(carDataModel: CarDataModel) {
        self.init(id: UUID().hashValue,
            vin: carDataModel.vin,
            brand: carDataModel.brand,
            model: carDataModel.model,
            year: carDataModel.year,
            text: "\(carDataModel.brand) \(carDataModel.model) \(carDataModel.year)")
    }
}
