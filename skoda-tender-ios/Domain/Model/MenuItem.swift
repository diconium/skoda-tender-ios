import Foundation
import SwiftData

@Model
final class MenuItem {
    var text: String
    var icon: String

    init(text: String, icon: String) {
        self.text = text
        self.icon = icon
    }
}
