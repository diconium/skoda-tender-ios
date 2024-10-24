import SwiftData
import SwiftUI

struct CarView: View {
    @StateObject var viewModel = CarViewModel()

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                VStack {
                    HeaderView(title: viewModel.carModelList?.model ?? "")
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
                    ForEach(viewModel.subscriptionList, id: \.self) { subscription in
                        CardView(title: subscription?.name ?? "",
                                 state: subscription?.status ?? "",
                                 expirationDate: subscription?.endDate ?? "")
                    }.padding(17)
                }
            }
        }
        .task {
            viewModel.getCarInfo()
            // viewModel.getSubscriptionsInfo()
        }
        .padding(0)
        .padding(.bottom, 10)
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

    var currentPage: Int = 0

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
