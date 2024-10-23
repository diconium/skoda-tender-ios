import SDWebImageSwiftUI
import SwiftUI

struct CardView: View {
    let cardAndImageWidth: CGFloat = 335
    let cardHeight: CGFloat = 177
    let imageHeight: CGFloat = 196
    let cornerRadius: CGFloat = 20

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 1)
                .frame(width: cardAndImageWidth, height: cardHeight)
                .background(.electric600)
            VStack(alignment: .leading, spacing: 10) {
                LazyVStack(alignment: .leading, spacing: 2) {
                    Text("Ambient Light")
                        .font(.custom("SKODANext-Bold", size: 14))
                    Text("Expired")
                        .font(.custom("SKODANext-Regular", size: 12))
                        .foregroundColor(SwiftUI.Color.red)
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 11)
            }
        }
        .frame(width: cardAndImageWidth, height: cardHeight)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    CardView()
}
