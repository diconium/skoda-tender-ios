import SwiftUI

struct ProfileView: View {
    let cornerRadius: CGFloat = 20

    @StateObject var viewModel = ProfileListViewModel()

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                ServicesHeaderView().padding(17)
                ScrollView(.horizontal) {
                    HStack {
                        CardView().padding(.leading, 17)
                        CardView().padding(.leading, 5)
                        CardView().padding(.horizontal, 5)
                    }
                }
                HStack {
                    ForEach(0 ..< 3) { index in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(index == self.viewModel.currentPage ? .accentColor : .white)
                            .onTapGesture(perform: { self.viewModel.currentPage = index })
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ambient Lighting - additional functions")
                        .font(.custom("SKODANext-Bold", size: 24))
                        .foregroundColor(SwiftUI.Color.white)
                    TimeleftHeaderView()
                    AutoRenewView()
                    Spacer()
                    HStack(alignment: .center) {
                        Button(action: {
                            if let yourURL = URL(string: "https://shop.skoda-connect.com") {
                                UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                            }

                        }) {
                            Text("Purchase")
                                .font(.custom("SKODANext-Light", size: 14))
                                .foregroundStyle(.white)
                                .padding(10)
                        }.buttonStyle(.bordered)
                    }
                }
                .padding(17)
                .padding(.top, 17)
                .background(.neutral800)
                .addBorder(.neutral800, width: 1, cornerRadius: cornerRadius)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 10)
        }.background(.neutral900)
    }
}

struct TimeleftHeaderView: View {
    var body: some View {
        HStack {
            Image(.ellipseRed)
                .foregroundColor(.neutral200)
            Text("EXPIRED")
                .font(.custom("SKODANext-Regular", size: 14))
                .foregroundStyle(.white)
            Text("on 22 Aug 2024")
                .font(.custom("SKODANext-Light", size: 14))
                .foregroundStyle(.neutral200)
            Spacer()
        }
    }
}

struct AutoRenewView: View {
    @State private var doesClose = true

    var body: some View {
        HStack {
            Text("Auto-Renew")
                .font(.custom("SKODANext-Light", size: 14))
                .foregroundStyle(.white)
                .padding(10)
            Spacer()
            Toggle("", isOn: $doesClose)
                .toggleStyle(.switch)
                .tint(.electric300)
                .fixedSize()
                .scaleEffect(0.8)
                .offset(x: 5)
        }
        .frame(height: 44)
        .background(.emerald800)
        Text("Experience perfect comfort with interior lighting. The ambient LED lighting includes footwell illumination and offers up to thirty attractive color options.")
            .font(.custom("SKODANext-Regular", size: 18))
            .foregroundStyle(.white)
            .padding(10)
    }
}

#Preview {
    ProfileView()
}
