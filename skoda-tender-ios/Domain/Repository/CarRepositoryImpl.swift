//
//  MessageRepositoryImpl.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

struct CarRepositoryImpl: CarRepository {
    
    var dataSource: CarDataSource
    
    func getCarInfo() -> [Car] {
        return dataSource.getCarInfo()
    }
}
