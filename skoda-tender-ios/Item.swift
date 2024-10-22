//
//  Item.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
