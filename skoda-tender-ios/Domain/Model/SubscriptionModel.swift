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
    var sDescription: String? // A stored property cannot be named 'description', coreData reserved
    var imageLink: String?
    var length: Int
    var price: Double
    var includedServices: [IncludedServiceDataModel]?
    var status: String
    var startDate: Date
    var endDate: Date?

    init(id: Int, name: String, sDescription: String? = nil, imageLink: String? = nil, length: Int, price: Double, includedServices: [IncludedServiceDataModel]? = nil, status: String, startDate: Date, endDate: Date? = nil) {
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

    init(subscriptionDataModel: SubscriptionDataModel) {
        self.id = UUID().hashValue
        self.name = subscriptionDataModel.name
        self.sDescription = subscriptionDataModel.description
        self.imageLink = subscriptionDataModel.imageLink
        self.length = subscriptionDataModel.length
        self.price = subscriptionDataModel.price
        self.includedServices = subscriptionDataModel.includedServices
        self.status = subscriptionDataModel.status
        self.startDate = DateHelper.parse(date: subscriptionDataModel.startDate, format: "yyyy-MM-dd'T'HH:mm:ss")! //dont add a default value so we dont hide data errors, this should break on a nil value!
        if let subscriptionDataModelEndDate = subscriptionDataModel.endDate {

            self.endDate = DateHelper.parse(date: subscriptionDataModelEndDate, format: "yyyy-MM-dd'T'HH:mm:ss")
        }
    }
}
