//
//  StatusDataSource.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Alamofire
import Foundation

// MARK: - StatusDataSource

/// A data source protocol for the status of a car.
protocol StatusDataSource {
    func getStatus(completionHandler: @escaping (DataResponse<StatusDataModel, AFError>) -> Void)
}
