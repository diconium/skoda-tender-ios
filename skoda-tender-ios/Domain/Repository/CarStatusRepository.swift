//
//  CarRepository.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

protocol CarStatusRepository {

    func getCarStatus(completionHandler: @escaping NetworkDataResponseHandler) -> Void
}
