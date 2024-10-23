//
//  Car.swift
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
    var text: String

    init(id: Int, vin: String, text: String) {
        self.id = id
        self.vin = vin
        self.text = text
    }

    init(carDataModel: CarDataModel) {
        self.id = UUID().hashValue //@cagica needs 2refactor
        self.vin = carDataModel.vin
        self.text = "\(carDataModel.brand), \(carDataModel.model)"
    }
}
