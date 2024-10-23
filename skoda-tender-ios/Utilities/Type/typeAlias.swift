//
//  typeAlias.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//
import Alamofire

typealias NetworkDataResponseHandler = (DataResponse<StatusDataModel, AFError>) -> Void
