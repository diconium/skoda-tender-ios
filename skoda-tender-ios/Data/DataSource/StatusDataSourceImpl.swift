//
//  StatusDataSourceImpl.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Alamofire
import Foundation

/// A data source for retrieving the status of a car.
struct StatusDataSourceImpl: StatusDataSource {
    func getStatus(completionHandler: @escaping NetworkDataResponseHandler) {
        AF.request(Constants.API.baseURL, method: .get)
            .cacheResponse(using: .cache)
            .redirect(using: .follow)
            .responseDecodable(of: StatusDataModel.self, completionHandler: completionHandler)
    }
}
