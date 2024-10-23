//
//  GetCarInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: Protocol GetCarInfoProtocol
fileprivate protocol GetCarInfoProtocol {
    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void)
}

// MARK: GetCarInfoUseCase
struct GetCarInfoUseCase: GetCarInfoProtocol {
    let repository: StatusRepository

    func execute(useCaseResult: @escaping (Result<CarModel, UseCaseError>) -> Void) {

        repository.getStatus { networkDataResponseHandler in

            let networkDatResult = networkDataResponseHandler.result
            switch networkDatResult {

            case .success(let data):
                guard let car = data.car else {

                    useCaseResult(.failure(UseCaseError.networkError))
                    return
                }
                let carModel = CarModel(carDataModel: car)
                useCaseResult(.success(carModel))

            case .failure(_):
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }
}
