import Foundation
import SwiftUI

struct ProfileListView: View {
    @StateObject var viewModel = ProfileListViewModel()

    var body: some View {
        VStack {
            Text("Messages: ")
            List(viewModel.carModelList) { car in
                Text(car.text)
            }
        }
            .task {
            viewModel.getCarInfo()
        }
    }
}

class ProfileListViewModel: ObservableObject {
    let getCarInfoUseCase: GetCarInfoUseCase = {
        let statusDataSourceImpl = StatusDataSourceImpl()
        let carStatusRepositoryImpl = StatusRepositoryImpl(dataSource: statusDataSourceImpl)

        return GetCarInfoUseCase(repository: carStatusRepositoryImpl)
    }()

    @Published var carModelList: [CarModel] = []

    func getCarInfo() {
        getCarInfoUseCase.execute { useCaseResult in

            switch useCaseResult {

            case .success(let useCaseData):
                break // TODO(Sergio): Handle the data on UI

            case .failure(let useCaseError):
                break // TODO(Sergio): Handle the error on UI
            }
        }
    }
}
