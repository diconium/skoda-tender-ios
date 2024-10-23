//
//  StatusDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - Status
import Alamofire

struct StatusDataModel: Codable, Sendable {

    let user: UserDataModel
    let car: CarDataModel?
    let subscriptions: [SubscriptionDataModel]?
}
