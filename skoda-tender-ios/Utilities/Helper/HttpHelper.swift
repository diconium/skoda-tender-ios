//
//  CarDataModel.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Foundation
import SystemConfiguration
import Alamofire

class HttpHelper {

    public struct HTTP_CODE {
        public static let NETWORK_NOT_FOUND = -1
        public static let OK = 200
        public static let CREATED = 201
        public static let ACCEPTED = 202
        public static let NOT_AUTHORITATIVE = 203
        public static let NO_CONTENT = 204
        public static let RESET = 205
        public static let PARTIAL = 206
        public static let MULT_CHOICE = 300
        public static let MOVED_PERM = 301
        public static let MOVED_TEMP = 302
        public static let SEE_OTHER = 303
        public static let NOT_MODIFIED = 304
        public static let USE_PROXY = 305
        public static let BAD_REQUEST = 400
        public static let UNAUTHORIZED = 401
        public static let PAYMENT_REQUIRED = 402
        public static let FORBIDDEN = 403
        public static let NOT_FOUND = 404
        public static let BAD_METHOD = 405
        public static let NOT_ACCEPTABLE = 406
        public static let PROXY_AUTH = 407
        public static let CLIENT_TIMEOUT = 408
        public static let CONFLICT = 409
        public static let GONE = 410
        public static let LENGTH_REQUIRED = 411
        public static let PRECON_FAILED = 412
        public static let ENTITY_TOO_LARGE = 413
        public static let REQ_TOO_LONG = 414
        public static let UNSUPPORTED_TYPE = 415
        public static let INTERNAL_ERROR = 500
        public static let NOT_IMPLEMENTED = 501
        public static let BAD_GATEWAY = 502
        public static let UNAVAILABLE = 503
        public static let GATEWAY_TIMEOUT = 504
        public static let VERSION = 505
    }

    var alomafireSession: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30

        return Session(configuration: configuration, redirectHandler: .follow, cachedResponseHandler: .cache)
    }()

    public static let shared = HttpHelper()

    func invalidateAndCancelAllTasks() {

        alomafireSession.session.invalidateAndCancel()
    }

    func makeRequest(url: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        self.makeRequest(url, method: method, headers: headers, completionHandler: completionHandler)
    }

    func makeRequest(url: String, parameter: [String: String], encoding: ParameterEncoding, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        self.makeRequest(url, parameters: parameter, encoding: encoding, completionHandler: completionHandler)
    }

    func makeRequest(url: String, parameter: [String: Any], method: HTTPMethod, headers: HTTPHeaders, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        self.makeRequest(url, method: method, parameters: parameter, headers: headers, completionHandler: completionHandler)
    }

    func makeRequest(url: String, body: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        if !body.isEmpty {

            request.httpBody = body.data(using: .utf8, allowLossyConversion: false)
        }
        headers.forEach { httpHeader in

            request.setValue(httpHeader.value, forHTTPHeaderField: httpHeader.name)
        }

        self.makeRequest(request, completionHandler: completionHandler)
    }

    func makeRequest(_ urlConvertible: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        alomafireSession.request(urlConvertible, method: method, parameters: parameters, encoding: encoding, headers: headers).response(completionHandler: completionHandler)
    }

    func makeRequest(_ urlRequest: URLRequest, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {

        alomafireSession.request(urlRequest).response(completionHandler: completionHandler)
    }
}
