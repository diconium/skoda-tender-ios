//
//  LocalDataSource.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

protocol CarDataSource {
    func getCarInfo() -> [Car]
}
