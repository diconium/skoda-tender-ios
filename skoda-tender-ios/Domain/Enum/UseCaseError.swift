//
//  UseCaseError.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: Error use cases

/// An error that can occur during the use of a use case.
enum UseCaseError: Error {
    case networkError, decodingError, undefinedError
}
