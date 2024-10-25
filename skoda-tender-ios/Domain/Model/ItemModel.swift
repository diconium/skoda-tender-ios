//
//  ItemModel.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import SwiftData

// MARK: - ItemModel

/// Represents an item with a timestamp.
/// - Parameter timestamp: The date and time when the item was created or modified.
@Model
final class ItemModel {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
