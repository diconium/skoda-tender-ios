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
                handleExpiringSubscriptions(subscriptionDataModelList: subscriptionDataModelList)

            case .failure:
                useCaseResult(.failure(UseCaseError.networkError))
            }
        }
    }

    private func handleExpiringSubscriptions(subscriptionDataModelList: [SubscriptionModel]) {
        let nonNullEndDateModels = subscriptionDataModelList.filter { $0.endDate != nil && $0.status == "Activated" }
        let aboutToExpireModels = nonNullEndDateModels.filter {
            if let endDate = $0.endDate {

                let daysUntilExpiring = DateHelper.timeElapsed(startDate: Date(), endDate: endDate, calendarComponent: .day) ?? 0

                return daysUntilExpiring <= Constants.Business.maxDaysUntilSubscriptionExpire
            }

            return false
        }
        if let aboutToExpireModel = aboutToExpireModels.first {

            NotificationHelper.showUserNotification(title: "Subscription is about to expire", message: "Your subscription '\(aboutToExpireModel.name)' is about to expire, click here to renew it.")
        }
    }
}
