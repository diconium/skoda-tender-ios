//
//  LocalDataSourceImp.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

struct CarDataSourceImpl: CarDataSource {
    
    func getCarInfo() -> [Car] {
        return [
            Car(id: 1, vin: "TESTVIN", text: "Hello World"),
            Car(id: 2, vin: "TESTVIN", text: "Hello World 2"),
            Car(id: 3, vin: "TESTVIN", text: "Hello World 3")
        ]
    }
}
