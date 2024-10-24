//
//  GetSubscriptionsInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

// MARK: Protocol GetSubscriptionsInfoProtocol

private protocol GetSubscriptionsInfoProtocol {
    func execute(useCaseResult: @escaping (Result<[SubscriptionModel], UseCaseError>) -> Void)
}

// MARK: GetSubscriptionsInfoUseCase

struct GetSubscriptionsInfoUseCase: GetSubscriptionsInfoProtocol {
    let repository: StatusRepository

    func execute(useCaseResult: @escaping (Result<[SubscriptionModel], UseCaseError>) -> Void) {
        repository.getStatus { networkDataResponseHandler in

            let networkDatResult = networkDataResponseHandler.result
            switch networkDatResult {
            case let .success(data):
                guard let subscriptions = data.subscriptions else {
                    useCaseResult(.failure(UseCaseError.networkError))
                    return
                }
                let subscriptionDataModelList = subscriptions.compactMap { SubscriptionModel(subscriptionDataModel: $0) }
                useCaseResult(.success(subscriptionDataModelList))

            case .failure:
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }
}
