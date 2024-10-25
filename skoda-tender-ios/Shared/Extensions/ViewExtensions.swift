import SwiftUI

public extension View {

    /// Clips this view to its bounding frame, with the specified corner radius.
    ///
    /// - Parameters:
    ///   - cornerRadius: The radius of each corner.
    ///   - content: The content to use for the border.
    ///   - width: The width of the border line.
    ///
    /// - Returns: A view that clips this view to its bounding frame with rounded corners and a border.
    func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S: ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
