//
//  GetCarInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: Protocol GetCarInfoProtocol

private protocol GetCarInfoProtocol {
    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void)
}

// MARK: GetCarInfoUseCase

/// A use case responsible for retrieving car information.
/// It utilizes a repository to fetch the status and maps the result to a `CarModel`.
///
/// - Parameters:
///   - useCaseResult: A closure that returns a `Result` containing either a `CarModel` on success or a `UseCaseError` on failure.
struct GetCarInfoUseCase: GetCarInfoProtocol {
    let repository: StatusRepository

    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void) {
        repository.getStatus { networkDataResponseHandler in

            let networkDatResult = networkDataResponseHandler.result
            switch networkDatResult {
            case let .success(data):
                guard let car = data.car else {
                    useCaseResult(.failure(UseCaseError.networkError))
                    return
                }
                let carModel = CarModel(carDataModel: car)
                useCaseResult(.success(carModel))

            case .failure:
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }
}
