//
//  CarModel.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

/// A model representing a car with various attributes.
@Model
final class CarModel {
    var id: Int
    var vin: String
    var brand: String
    var model: String
    var year: Int
    var text: String

    /// Initializes a new instance of `CarModel`.
    /// - Parameters:
    ///   - id: Unique identifier for the car.
    ///   - vin: Vehicle Identification Number.
    ///   - brand: Brand of the car.
    ///   - model: Model of the car.
    ///   - year: Manufacturing year of the car.
    ///   - text: Descriptive text about the car.
    init(id: Int, vin: String, brand: String, model: String, year: Int, text: String) {
        self.id = id
        self.vin = vin
        self.brand = brand
        self.model = model
        self.year = year
        self.text = text
    }

    /// Convenience initializer to create a `CarModel` from a `CarDataModel`.
    /// - Parameter carDataModel: The data model containing car information.
    convenience init(carDataModel: CarDataModel) {
        self.init(id: UUID().hashValue,
                  vin: carDataModel.vin,
                  brand: carDataModel.brand,
                  model: carDataModel.model,
                  year: carDataModel.year,
                  text: "\(carDataModel.brand) \(carDataModel.model) \(carDataModel.year)")
    }
}
