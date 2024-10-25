import SwiftData
import SwiftUI

struct CarView: View {
    @StateObject var viewModel = CarViewModel()

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ZStack(alignment: .top) {
                    VStack {
                        HeaderView(title: viewModel.carModelList?.model ?? "")
                        ConnectionView()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    Image(.car)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(0)
                }
                CarInfoView(type: CarInfoView.ViewType.vehicle).padding(.horizontal, 17)
                CarInfoView(type: CarInfoView.ViewType.battery).padding(.horizontal, 17)
                CarInfoView(type: CarInfoView.ViewType.temperature).padding(.horizontal, 17)
                ServicesHeaderView().padding(.top, 10).padding(.horizontal, 17)
                CardListView(viewModel: viewModel, linkACtive: true).padding(.horizontal, 17)
            }
            .task {
                viewModel.getCarInfo()
                viewModel.getSubscriptionsInfo()
            }
            .padding(0)
        }
    }
}

struct CardListView: View {
    @StateObject var viewModel = CarViewModel()
    var linkACtive: Bool

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.subscriptionList, id: \.self) {
                    subscription in
                    if let subscription {
                        CardView(subscription: subscription, linkActive: linkACtive)
                            .onAppear {
                                viewModel.currentPage = viewModel.subscriptionList[0]
                            }
                    }
                }.padding(5)
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $viewModel.currentPage)
        .scrollIndicators(.never)
    }
}

class CarViewModel: ObservableObject {
    let getCarInfoUseCase: GetCarInfoUseCase = {
        let statusDataSourceImpl = StatusDataSourceImpl()
        let carStatusRepositoryImpl = StatusRepositoryImpl(dataSource: statusDataSourceImpl)

        return GetCarInfoUseCase(repository: carStatusRepositoryImpl)
    }()

    let getSubscriptionsInfoUseCase: GetSubscriptionsInfoUseCase = {
        let statusDataSourceImpl = StatusDataSourceImpl()
        let carStatusRepositoryImpl = StatusRepositoryImpl(dataSource: statusDataSourceImpl)

        return GetSubscriptionsInfoUseCase(repository: carStatusRepositoryImpl)
    }()

    @Published var carModelList: CarModel?
    @Published var subscriptionList: [SubscriptionModel?] = []
    @Published var isError: Bool = false

    @Published var currentPage: SubscriptionModel?

    func getCarInfo() {
        getCarInfoUseCase.execute { useCaseResult in

            switch useCaseResult {
            case let .success(useCaseData):
                self.carModelList = useCaseData

            case .failure:
                self.isError = true
            }
        }
    }

    func getSubscriptionsInfo() {
        getSubscriptionsInfoUseCase.execute { useCaseResult in

            switch useCaseResult {
            case let .success(useCaseData):
                self.subscriptionList = useCaseData

            case .failure:
                self.isError = true
            }
        }
    }
}

struct HeaderView: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
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
        }
    }
}

#Preview {
    ZStack {
        Color(.black)
        CarView()
    }
}
