import SwiftUI

struct ProfileView: View {
    enum ViewState {
        case expired, active, new
    }

    let sheetcornerRadius: CGFloat = 20
    var viewState: ViewState = .active

    @State var isPresented = true
    @StateObject var viewModel = ProfileListViewModel()

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                ServicesHeaderView().padding(17)
                PillsView().padding(17)
                ScrollView(.horizontal) {
                    HStack {
                        CardView(title: "Ambient Lighting", state: "EXPIRED", expirationDate: "on 22 Aug 2024").padding(.leading, 17)
                        CardView(title: "Ambient Lighting", state: "EXPIRED", expirationDate: "on 22 Aug 2024").padding(.leading, 5)
                        CardView(title: "Ambient Lighting", state: "EXPIRED", expirationDate: "on 22 Aug 2024").padding(.horizontal, 5)
                    }
                }
                HStack {
                    ForEach(0 ..< 3) { index in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(index == self.viewModel.currentPage ? .accentColor : .white)
                            .onTapGesture(perform: { self.viewModel.currentPage = index })
                    }
                }.padding(20)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Ambient Lighting - additional functions")
                        .font(.custom("SKODANext-Bold", size: 24))
                        .foregroundColor(SwiftUI.Color.white)
                    TimeleftHeaderView()
                    ScrollView(.vertical) {
                        AutoRenewView()
                        if viewState == ViewState.active {
                            Text("Included Services")
                                .font(.custom("SKODANext-Bold", size: 16))
                                .foregroundColor(SwiftUI.Color.white)
                                .padding(.bottom, 10)
                            AccordionView()
                            AccordionView()
                            AccordionView()
                        }
                    }
                    Spacer()
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                            if let yourURL = URL(string: "https://shop.skoda-connect.com") {
                                UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                            }

                        }, label: {
                            Text("Purchase")
                                .font(.custom("SKODANext-Regular", size: 16))
                                .foregroundStyle(.black)
                                .padding(.vertical, 10)
                                .frame(width: 300, height: 52)
                        })
                        .tint(.accent)
                        .controlSize(.small)
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                }
                .padding(17)
                .padding(.top, 17)
                .background(.neutral800)
                .addBorder(.neutral800, width: 1, cornerRadius: sheetcornerRadius)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 10)
        }
        .background(.neutral900)
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

struct PillsView: View {
    @State private var doesClose = true
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Button("Ambient Lighting") {
                    print("Button pressed!")
                }
                .tint(.neutral800)
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                Button("Ambient Lighting") {
                    print("Button pressed!")
                }
                .tint(.neutral900)
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                Button("Ambient Lighting") {
                    print("Button pressed!")
                }
                .tint(.neutral900)
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct AccordionView: View {
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        + "Aliquam sed mauris sit amet ex finibus suscipit."
        + "Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. "
        + "Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl." +
        "Proin dictum ligula vel interdum hendrerit."
    var body: some View {
        VStack {
            DisclosureGroup("Pay to Fuel") {
                VStack {
                    Text(text)
                }
            }.padding()
        }
        .background(.neutral900)
        .addBorder(.neutral900, width: 1, cornerRadius: 5)
    }
}

struct AutoRenewView: View {
    @State private var doesClose = true

    var body: some View {
        HStack {
            Text("Auto-Renew")
                .font(.custom("SKODANext-Light", size: 14))
                .foregroundStyle(.neutral200)
            Spacer()
            Toggle("", isOn: $doesClose)
                .toggleStyle(.switch)
                .tint(.electric300)
                .fixedSize()
                .scaleEffect(0.8)
        }
        .padding(10)
        .frame(height: 44)
        .background(.emerald800)
        Text("Experience perfect comfort with interior lighting. The ambient LED lighting includes footwell illumination and offers up to thirty attractive color options.")
            .font(.custom("SKODANext-Regular", size: 18))
            .foregroundStyle(.white)
    }
}

#Preview {
    ProfileView()
}
