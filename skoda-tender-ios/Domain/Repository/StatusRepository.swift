//
//  StatusRepository.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: - StatusRepository

/// A protocol that defines the methods for fetching status information.
protocol StatusRepository {
    func getStatus(completionHandler: @escaping NetworkDataResponseHandler)
}
