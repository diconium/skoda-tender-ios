//
//  GetUserInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

// MARK: Protocol GetUserInfoProtocol

/// Protocol defining the contract for fetching user information.
private protocol GetUserInfoProtocol {
    /// Executes the use case to fetch user information.
    /// - Parameter useCaseResult: A closure that returns a result containing either a `UserModel` or a `UseCaseError`.
    func execute(useCaseResult: @escaping (Result<UserModel, UseCaseError>) -> Void)
}

// MARK: GetUserInfoUseCase

/// Use case responsible for fetching user information from the repository.
struct GetUserInfoUseCase: GetUserInfoProtocol {
    let repository: StatusRepository

    /// Executes the use case to fetch user information.
    /// - Parameter useCaseResult: A closure that returns a result containing either a `UserModel` or a `UseCaseError`.
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
