//
//  StatusRepository.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

protocol StatusRepository {
    func getStatus(completionHandler: @escaping NetworkDataResponseHandler)
}
