//
//  StatusDataSource.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation
import Alamofire

protocol StatusDataSource {
    
    func getStatus(completionHandler: @escaping (DataResponse<StatusDataModel, AFError>) -> Void) -> Void
}
