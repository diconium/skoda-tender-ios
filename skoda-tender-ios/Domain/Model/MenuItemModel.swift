import Foundation
import SwiftData

/// Represents a menu item with text and icon.
@Model
final class MenuItemModel {
    var text: String
    var icon: String

    init(text: String, icon: String) {
        self.text = text
        self.icon = icon
    }
}
