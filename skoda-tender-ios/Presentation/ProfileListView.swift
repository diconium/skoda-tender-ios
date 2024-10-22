import Foundation
import SwiftUI

struct ProfileListView: View {
    @StateObject var viewModel = Pro()

    var body: some View {
        VStack {
            Text("Messages: ")
            List(viewModel.cars) { cars in
                Text(cars.text)
            }
        }
        .task {
            viewModel.getCarInfo()
        }
    }
}

// MARK: View

/// Produce a greeting string for the given `subject`.
///
/// ```
/// print(hello("world")) // "Hello, world!"
/// ```
///
/// > Warning: The returned greeting is not localized. To
/// > produce a localized string, use ``localizedHello(_:)``
/// > instead.
///
/// - Parameters:
///     - subject: The subject to be welcomed.
///
/// - Returns: A greeting for the given `subject`.
///

class ProfileListViewModel: ObservableObject {
    // 2
    var getCarInfoUseCase = GetCarInfoUseCase(repository: CarRepositoryImpl(dataSource: CarDataSourceImpl()))

    // 3
    @Published var cars: [Car] = []

    // 4
    func getCarInfo() {
        let result = getCarInfoUseCase.execute()
        switch result {
        case let .success(cars):
            self.cars = cars
        case let .failure(error):
            print(error)
        }
    }
}
