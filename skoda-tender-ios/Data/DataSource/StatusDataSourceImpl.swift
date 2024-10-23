//
//  StatusDataSourceImpl.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import Alamofire

struct StatusDataSourceImpl: StatusDataSource {

    func getCarStatus(completionHandler: @escaping NetworkDataResponseHandler) {
        AF.request(Constants.API.baseURL, method: .get)
            .cacheResponse(using: .cache)
            .redirect(using: .follow)
            .responseDecodable(of: StatusDataModel.self, completionHandler: completionHandler)
    }
}

