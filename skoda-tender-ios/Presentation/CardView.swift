import SDWebImageSwiftUI
import SwiftUI

struct CardView: View {
    let cardWidth: CGFloat = 300
    let cardHeight: CGFloat = 80
    let imageHeight: CGFloat = 196
    let cornerRadius: CGFloat = 5

    @StateObject var viewModel = CarViewModel()
    var subscription: SubscriptionModel
    @State var linkActive: Bool = true

    var body: some View {
        NavigationLink(destination: DetailView(subscription: subscription)) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    TimeleftHeaderBreakLineView(state: subscription.status, expirationDate: subscription.endDate?.description ?? "Test")
                    Spacer()
                    Image(.dotsVertical)
                }
                Spacer()
                Text(subscription.name)
                    .font(.custom("SKODANext-Bold", size: 20))
                    .foregroundColor(SwiftUI.Color.white)
            }
            .frame(width: cardWidth, height: cardHeight)
            .padding(.horizontal, 15)
            .padding(.top, 10)
            .padding(.bottom, 25)
            .background(.neutral800)
            .addBorder(.neutral800, width: 1, cornerRadius: cornerRadius)
            .background(.neutral800)
        }
        .disabled(!linkActive)
        .preferredColorScheme(.dark)
    }
}

struct TimeleftHeaderBreakLineView: View {
    var state: String
    var expirationDate: String

    var body: some View {
        let image: ImageResource = if state == "Activated" { .ellpseElectric300 } else { .ellipseRed }

        VStack(alignment: .leading) {
            HStack {
                Image(image)
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
