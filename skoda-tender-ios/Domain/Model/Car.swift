//
//  Car.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

@Model
final class Car {
    var id: Int
    var vin: String
    var text: String

    init(id: Int, vin: String, text: String) {
        self.id = id
        self.vin = vin
        self.text = text
    }
}
