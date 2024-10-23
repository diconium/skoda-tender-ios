//
//  GetCarInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: Error use cases
enum UseCaseError: Error {
    case networkError, decodingError, undefinedError
}

// MARK: Protocol response
protocol GetCarInfoProtocol {
    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void)
}

// MARK: GetCarInfoUseCase
struct GetCarInfoUseCase: GetCarInfoProtocol {
    var repository: CarStatusRepository

    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void) {

        repository.getCarStatus { networkDataResponseHandler in

            let networkDatResult = networkDataResponseHandler.result
            switch networkDatResult {

            case .success(let data):
                let carModel = CarModel(carDataModel: data.car)
                useCaseResult(.success(carModel))

            case .failure(_):
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }
}
