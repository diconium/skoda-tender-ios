//
//  SubscriptionModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import SwiftData

@Model
final class SubscriptionModel {

    var id: Int
    var name: String
    var sDescription: String? //A stored property cannot be named 'description', coreData reserved
    var imageLink: String?
    var length: Int
    var price: Double
    var includedServices: [IncludedServiceDataModel]?
    var status: String
    var startDate: String
    var endDate: String?


    init(id: Int, name: String, sDescription: String? = nil, imageLink: String? = nil, length: Int, price: Double, includedServices: [IncludedServiceDataModel]? = nil, status: String, startDate: String, endDate: String? = nil) {
        self.id = id
        self.name = name
        self.sDescription = sDescription
        self.imageLink = imageLink
        self.length = length
        self.price = price
        self.includedServices = includedServices
        self.status = status
        self.startDate = startDate
        self.endDate = endDate
    }

    convenience init(subscriptionDataModel: SubscriptionDataModel) {
        self.init(id: UUID().hashValue,
            name: subscriptionDataModel.name,
            sDescription: subscriptionDataModel.description,
            imageLink: subscriptionDataModel.imageLink,
            length: subscriptionDataModel.length,
            price: subscriptionDataModel.price,
            includedServices: subscriptionDataModel.includedServices,
            status: subscriptionDataModel.status,
            startDate: subscriptionDataModel.startDate,
            endDate: subscriptionDataModel.endDate)
    }
}
