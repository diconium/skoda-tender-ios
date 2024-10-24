//
//  StatusRepositoryImpl.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

struct StatusRepositoryImpl: StatusRepository {
    var dataSource: StatusDataSource

    func getStatus(completionHandler: @escaping NetworkDataResponseHandler) {
        dataSource.getStatus(completionHandler: completionHandler)
    }
}
