//
//  SubscriptionModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import SwiftData


/// A model representing a subscription with various attributes such as name, description, image link, length, price,
/// included services, status, start date, and optional end date.
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

    /// Initializes a new instance of `SubscriptionModel` with the specified parameters.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the subscription.
    ///   - name: The name of the subscription.
    ///   - sDescription: An optional description of the subscription.
    ///   - imageLink: An optional link to an image representing the subscription.
    ///   - length: The length of the subscription in days.
    ///   - price: The price of the subscription.
    ///   - includedServices: An optional array of services included in the subscription.
    ///   - status: The current status of the subscription.
    ///   - startDate: The start date of the subscription.
    ///   - endDate: An optional end date of the subscription.
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

    /// Initializes a new instance of `SubscriptionModel` using a `SubscriptionDataModel`.
    ///
    /// - Parameter subscriptionDataModel: The data model containing subscription details.
    /// - Note: The `id` is generated using `UUID().hashValue`. The `startDate` is parsed using the format "yyyy-MM-dd'T'HH:mm:ss".
    ///         If `subscriptionDataModel.endDate` is provided, it is parsed similarly.
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
