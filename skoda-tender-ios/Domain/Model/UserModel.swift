//
//  UserModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import SwiftData

@Model
final class UserModel {
    var id: Int
    var email: String
    var name: String

    init(id: Int, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }

    convenience init(userDataModel: UserDataModel) {
        self.init(id: UUID().hashValue,
                  email: userDataModel.email,
                  name: userDataModel.name)
    }
}
