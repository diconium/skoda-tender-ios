import SwiftUI

struct DetailView: View {
    enum ViewState {
        case expired, active, new
    }

    let sheetcornerRadius: CGFloat = 20

    @State private var showSheet = true
    @State private var sheetHeight: CGFloat = .zero
    @State private var viewHeight: CGFloat = .zero
    @State private var bottomSheetHeight: CGFloat = 0

    @StateObject var viewModel = CarViewModel()
    @State var subscription: SubscriptionModel
    @State private var doesClose = true

    var body: some View {
        let buttonText: String = if viewModel.currentPage?.status == "Activated" {
            "Extend for one extra year"
        } else { "Expired: Renew for one year" }

        let state = if viewModel.currentPage?.status == "Activated" {
            ViewState.active
        } else {
            ViewState.expired
        }

        HStack(alignment: .top) {
            VStack {
                ServicesHeaderView().padding(17)
                PillsView().padding(17)
                ScrollViewReader { _ in
                    CardListView(viewModel: viewModel, linkACtive: false)
                        .padding(.horizontal, 17)
                        .padding(.bottom, 20)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ambient Lighting - additional functions")
                            .font(.custom("SKODANext-Bold", size: 24))
                            .foregroundColor(SwiftUI.Color.white)
                        ScrollView(.vertical) {
                            timeleftHeaderView
                            autoRenewView
                            if state == ViewState.active {
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
                                Text(buttonText)
                                    .font(.custom("SKODANext-Bold", size: 18))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 10)
                                    .frame(width: 300, height: 52)
                            })
                            .tint(.accent)
                            .controlSize(.small)
                            .buttonStyle(.borderedProminent)
                            .padding(.bottom, 40)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 17)
                    .padding(.bottom, 0)
                    .background(.neutral800)
                    .addBorder(.neutral800, width: 1, cornerRadius: 20)
                    Spacer()
                }
            }
            .padding(.top, 10)
        }
        .task {
            viewModel.getSubscriptionsInfo()
        }
        .background(.neutral900)
    }

    var timeleftHeaderView: some View {
        HStack {
            if viewModel.currentPage?.status == "Activated" {
                Image(.ellpseElectric300)
            } else {
                Image(.ellipseRed)
            }

            if viewModel.currentPage?.status == "Activated" {
                Text("ACTIVE")
                    .font(.custom("SKODANext-Regular", size: 14))
                    .foregroundStyle(.white)
            } else {
                Text("EXPIRED")
                    .font(.custom("SKODANext-Regular", size: 14))
                    .foregroundStyle(.white)
            }

            Text("on " + DateHelper.format(date: subscription.endDate ?? Date.distantFuture, format: "yyyy-MM-dd"))
                .font(.custom("SKODANext-Light", size: 14))
                .foregroundStyle(.neutral200)
            Spacer()
        }
    }

    var autoRenewView: some View {
        VStack {
            HStack {
                if viewModel.currentPage?.status == "Activated" {
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
                    .frame(height: 44)
                    .padding(.horizontal, 17)
                    .background(.emerald800)
                } else { EmptyView() }
            }
            Text("Experience perfect comfort with interior lighting." +
                "The ambient LED lighting includes footwell illumination" +
                "and offers up to thirty attractive color options.")
                .font(.custom("SKODANext-Regular", size: 18))
                .padding(.top, 10)
                .foregroundStyle(.white)
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

#Preview {
    @Previewable @StateObject var viewModel = CarViewModel()

    DetailView(subscription: viewModel.subscriptionList.first!!)
}
