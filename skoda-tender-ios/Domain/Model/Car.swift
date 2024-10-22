//
//  Car.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

@Model
struct Car: Identifiable {
    let id: Int
    let vin: String
    let text: String
}
