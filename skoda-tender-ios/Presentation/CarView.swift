import SwiftData
import SwiftUI

struct CarView: View {
    private let items: [String] = [
        "test",
        "test",
        "test",
    ]

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                VStack {
                    HeaderView()
                    ConnectionView()
                }.padding(.horizontal, 20)
                Image(.car)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(0)
            }
            CarInfoView(type: CarInfoView.ViewType.vehicle).padding(.horizontal, 17)
            CarInfoView(type: CarInfoView.ViewType.battery).padding(.horizontal, 17)
            CarInfoView(type: CarInfoView.ViewType.temperature).padding(.horizontal, 17)
            ServicesHeaderView().padding(17)
            ScrollView(.horizontal) {
                HStack {
                    CardView().padding(.leading, 17)
                    CardView().padding(.leading, 5)
                    CardView().padding(.horizontal, 5)
                }
            }
        }.padding(0)
            .padding(.bottom, 10)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Enyaq Coupè")
                .font(.custom("SKODANext-Bold", size: 27))
                .foregroundStyle(.white)
            Spacer()
            Image(.notificationBell)
        }
    }
}

struct ConnectionView: View {
    var body: some View {
        HStack {
            Image(.refreshicon)
                .foregroundColor(.neutral200)
            Text("seconds ago")
                .font(.custom("SKODANext-Light", size: 14))
                .overlay(Divider().background(.neutral200), alignment: .trailing)
                .foregroundStyle(.neutral200)
            Image(.ellpseElectric300)
                .foregroundColor(.neutral200)
            Text("Online")
                .font(.custom("SKODANext-Light", size: 14))
                .foregroundStyle(.neutral200)
            Spacer()
        }
    }
}

struct ServicesHeaderView: View {
    var body: some View {
        HStack {
            Text("Payment Services")
                .font(.custom("SKODANext-Bold", size: 22))
                .foregroundStyle(.white)
            Spacer()
            Text("See All")
                .font(.custom("SKODANext-Regular", size: 14))
                .foregroundStyle(.electric300)
        }
    }
}

#Preview {
    ZStack {
        Color(.black)
        CarView()
    }
}
