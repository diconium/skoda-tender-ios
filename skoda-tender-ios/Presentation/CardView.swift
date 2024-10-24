import SDWebImageSwiftUI
import SwiftUI

struct CardView: View {
    let cardWidth: CGFloat = 300
    let cardHeight: CGFloat = 100
    let imageHeight: CGFloat = 196
    let cornerRadius: CGFloat = 5

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                TimeleftHeaderBreakLineView()
                Spacer()
                Image(.dotsVertical)
            }
            Spacer()
            Text("Ambient Lighting")
                .font(.custom("SKODANext-Bold", size: 20))
                .foregroundColor(SwiftUI.Color.white)
        }
        .frame(width: cardWidth, height: cardHeight)
        .padding(.horizontal, 25)
        .padding(.top, 10)
        .padding(.bottom, 25)
        .background(.neutral800)
        .addBorder(.electric300, width: 2, cornerRadius: cornerRadius)
    }
}

struct TimeleftHeaderBreakLineView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.ellipseRed)
                    .foregroundColor(.neutral200)
                Text("EXPIRED")
                    .font(.custom("SKODANext-Regular", size: 10))
                    .foregroundStyle(.white)
                Spacer()
            }
            Spacer()
            Text("on 22 Aug 2024")
                .font(.custom("SKODANext-Light", size: 12))
                .foregroundStyle(.neutral200)
        }
    }
}

#Preview {
    CardView()
}
