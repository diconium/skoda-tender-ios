//
//  GetMessages.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

// MARK: Error use cases

enum UseCaseError: Error {
    case networkError, decodingError, undefinedError
}

// MARK: Protocol response

protocol GetCarsInfoProtocol {
    func execute() -> Result<[Car], UseCaseError>
}

// MARK: GetCarInfoUseCase

struct GetCarInfoUseCase: GetCarsInfoProtocol {
    var repository: CarRepository
    
    
    func execute() -> Result<[Car], UseCaseError> {
        let cars = repository.getCarInfo()
        return .success(cars)
    }
} 
