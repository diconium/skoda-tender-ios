import SDWebImageSwiftUI
import SwiftUI

struct CardView: View {
    let cardWidth: CGFloat = 300
    let cardHeight: CGFloat = 80
    let imageHeight: CGFloat = 196
    let cornerRadius: CGFloat = 5

    var title: String
    var state: String
    var expirationDate: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                TimeleftHeaderBreakLineView(state: state, expirationDate: expirationDate)
                Spacer()
                Image(.dotsVertical)
            }
            Spacer()
            Text(title)
                .font(.custom("SKODANext-Bold", size: 20))
                .foregroundColor(SwiftUI.Color.white)
        }
        .frame(width: cardWidth, height: cardHeight)
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .padding(.bottom, 25)
        .background(.neutral800)
        .addBorder(.neutral800, width: 1, cornerRadius: cornerRadius)
    }
}

struct TimeleftHeaderBreakLineView: View {
    var state: String
    var expirationDate: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.ellipseRed)
                    .foregroundColor(.neutral200)
                Text(state)
                    .font(.custom("SKODANext-Regular", size: 10))
                    .foregroundStyle(.white)
                Spacer()
            }
            Text(expirationDate)
                .font(.custom("SKODANext-Light", size: 12))
                .foregroundStyle(.neutral200)
        }
    }
}

#Preview {
    CardView(title: "Ambient Lighting", state: "EXPIRED", expirationDate: "on 22 Aug 2024")
}
