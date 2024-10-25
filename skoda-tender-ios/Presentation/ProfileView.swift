import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value _: inout CGSize, nextValue _: () -> CGSize) {}
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

struct ProfileView: View {
    enum ViewState {
        case expired, active, new
    }

    let sheetcornerRadius: CGFloat = 20
    var viewState: ViewState = .active

    @State private var showSheet = true
    @State private var sheetHeight: CGFloat = .zero
    @State private var viewHeight: CGFloat = .zero
    @StateObject var viewModel = CarViewModel()
    @State private var bottomSheetHeight: CGFloat = 0

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
                Spacer()
            }
            .padding(.top, 10)
            .readSize { calculatedHeight in
                viewHeight = calculatedHeight.height
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Ambient Lighting - additional functions")
                    .font(.custom("SKODANext-Bold", size: 24))
                    .foregroundColor(SwiftUI.Color.white)
                    .padding(.top, 20)
                TimeleftHeaderView()
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
                .presentationDetents([.height(UIScreen.main.bounds.height), .height(UIScreen.main.bounds.height - viewHeight)])
                .presentationCornerRadius(20)
            }
            .padding(17)
            .padding(.top, 17)
            .background(.neutral800)
        }
        .background(.neutral900)
    }

    enum SheetPosition: CGFloat, CaseIterable {
        case peek = 0.1
        case detailed = 0.5

        var detent: PresentationDetent {
            .fraction(rawValue)
        }

        static let detents = Set(SheetPosition.allCases.map { $0.detent })
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
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
                Button("Škoda Connect Services") {
                    print("Button pressed!")
                }
                .font(.custom("SKODANext-Light", size: 14))
                .tint(.neutral800)
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                Button("Infotainment Apps") {
                    print("Button pressed!")
                }
                .font(.custom("SKODANext-Light", size: 14))
                .tint(.neutral900)
                .controlSize(.small)
                .buttonStyle(.borderedProminent)
                Button("On Demand Services") {
                    print("Button pressed!")
                }
                .font(.custom("SKODANext-Light", size: 14))
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
