//
//  GetUserInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

// MARK: Protocol GetUserInfoProtocol

private protocol GetUserInfoProtocol {
    func execute(useCaseResult: @escaping (Result<UserModel, UseCaseError>) -> Void)
}

// MARK: GetUserInfoUseCase

struct GetUserInfoUseCase: GetUserInfoProtocol {
    let repository: StatusRepository

    func execute(useCaseResult: @escaping (Result<UserModel, UseCaseError>) -> Void) {
        repository.getStatus { networkDataResponseHandler in

            let networkDatResult = networkDataResponseHandler.result
            switch networkDatResult {
            case let .success(data):
                let carModel = UserModel(userDataModel: data.user)
                useCaseResult(.success(carModel))

            case .failure:
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }
}
