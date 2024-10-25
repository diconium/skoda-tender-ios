//
//  StatusRepositoryImpl.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: - StatusRepositoryImpl

/// Implementation of the StatusRepository protocol.
/// This class is responsible for fetching status data from the data source.
struct StatusRepositoryImpl: StatusRepository {
    var dataSource: StatusDataSource

    /// Fetches the status data from the data source.
    /// - Parameter completionHandler: A closure to be executed once the request has finished.
    func getStatus(completionHandler: @escaping NetworkDataResponseHandler) {
        dataSource.getStatus(completionHandler: completionHandler)
    }
}
