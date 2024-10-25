//
//  UserDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//


// MARK: - UserDataModel

/// A model representing user data with user ID, email, and name.
struct UserDataModel: Codable, Sendable {
    let id: Int
    let email: String
    let name: String
}
