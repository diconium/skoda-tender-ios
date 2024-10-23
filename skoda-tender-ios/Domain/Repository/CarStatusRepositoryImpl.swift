//
//  CarRepositoryImpl.swift
//  skoda-tender-ios
//
//  Created by Sergio Cagica on 22/10/2024.
//

import Foundation

struct CarStatusRepositoryImpl: CarStatusRepository {
    var dataSource: StatusDataSource

    func getCarStatus(completionHandler: @escaping NetworkDataResponseHandler) -> Void {

        dataSource.getCarStatus(completionHandler: completionHandler)
//        } catch {
//
//            print("Failed to get car status: \(error.localizedDescription)")
//
//            return nil
//        }
    }
}
