//
//  GetSubscriptionsInfoUseCase.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation

// MARK: Protocol GetSubscriptionsInfoProtocol

/// Protocol to define the use case for fetching subscription information.
///
/// The `GetSubscriptionsInfoProtocol` is responsible for executing the use case
/// that retrieves a list of `SubscriptionModel` objects. The result of the execution
/// is returned asynchronously via a completion handler.
///
/// - Parameters:
///   - useCaseResult: A closure that is called with the result of the use case execution.
///                    It contains either an array of `SubscriptionModel` on success or
///                    a `UseCaseError` on failure.
private protocol GetSubscriptionsInfoProtocol {
    func execute(useCaseResult: @escaping (Result<[SubscriptionModel], UseCaseError>) -> Void)
}

// MARK: GetSubscriptionsInfoUseCase

/// A use case responsible for retrieving subscription information.
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

    /// Handles subscriptions that are about to expire.
    ///
    /// This function filters the list of `SubscriptionModel` to find those that have a non-nil
    /// end date and are currently activated. It then checks if any of these subscriptions are
    /// about to expire within a specified number of days. If a subscription is found to be
    /// expiring soon, a user notification is displayed to prompt the user to renew it.
    ///
    /// - Parameter subscriptionDataModelList: An array of `SubscriptionModel` objects to be checked
    ///   for expiring subscriptions.
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
