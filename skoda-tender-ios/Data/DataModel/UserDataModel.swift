//
//  UserDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

// MARK: - User
struct UserDataModel: Codable, Sendable {

    let id: Int?
    let email, name: String?
}
