//
//  UserModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import SwiftData

/// A model representing a user with an ID, email, and name.
@Model
final class UserModel {
    var id: Int
    var email: String
    var name: String

    /// Initializes a new user model with the given ID, email, and name.
    /// - Parameters:
    ///   - id: The unique identifier for the user.
    ///   - email: The email address of the user.
    ///   - name: The name of the user.
    init(id: Int, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }

    /// Convenience initializer that creates a user model from a `UserDataModel`.
    /// - Parameter userDataModel: The data model containing user information.
    convenience init(userDataModel: UserDataModel) {
        self.init(id: UUID().hashValue,
            email: userDataModel.email,
            name: userDataModel.name)
    }
}
