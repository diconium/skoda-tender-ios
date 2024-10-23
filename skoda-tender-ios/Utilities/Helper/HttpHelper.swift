//
//  HttpHelper.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 23/10/2024.
//

import Alamofire
import Foundation
import SystemConfiguration

class HttpHelper {
    
    public enum HTTPCode {
        public static let NetworkNotFound = -1
        public static let OK = 200
        public static let Created = 201
        public static let Accepted = 202
        public static let NotAuthoritative = 203
        public static let NoContent = 204
        public static let Reset = 205
        public static let Partial = 206
        public static let MultChoice = 300
        public static let MovedPerm = 301
        public static let MovedTemp = 302
        public static let SeeOther = 303
        public static let NotModified = 304
        public static let UseProxy = 305
        public static let BadRequest = 400
        public static let Unauthorized = 401
        public static let PaymentRequired = 402
        public static let Forbidden = 403
        public static let NotFound = 404
        public static let BadMethod = 405
        public static let NotAcceptable = 406
        public static let ProxyAuth = 407
        public static let ClientTimeout = 408
        public static let Conflict = 409
        public static let Gone = 410
        public static let LengthRequired = 411
        public static let PreconFailed = 412
        public static let EntityTooLarge = 413
        public static let ReqTooLong = 414
        public static let UnsupportedType = 415
        public static let InternalError = 500
        public static let NotImplemented = 501
        public static let BadGateway = 502
        public static let Unavailable = 503
        public static let GatewayTimeout = 504
        public static let Version = 505
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
        makeRequest(url, method: method, headers: headers, completionHandler: completionHandler)
    }

    func makeRequest(url: String, parameter: [String: String], encoding: ParameterEncoding, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {
        makeRequest(url, parameters: parameter, encoding: encoding, completionHandler: completionHandler)
    }

    func makeRequest(url: String, parameter: [String: Any], method: HTTPMethod, headers: HTTPHeaders, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {
        makeRequest(url, method: method, parameters: parameter, headers: headers, completionHandler: completionHandler)
    }

    func makeRequest(url: String, body: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        if !body.isEmpty {
            request.httpBody = body.data(using: .utf8, allowLossyConversion: false)
        }
        for httpHeader in headers {
            request.setValue(httpHeader.value, forHTTPHeaderField: httpHeader.name)
        }

        makeRequest(request, completionHandler: completionHandler)
    }

    func makeRequest(_ urlConvertible: URLConvertible,
                     method: HTTPMethod = .get,
                     parameters: Parameters? = nil,
                     encoding: ParameterEncoding = URLEncoding.default,
                     headers: HTTPHeaders? = nil,
                     completionHandler: @escaping (AFDataResponse<Data?>) -> Void)
    {
        alomafireSession.request(urlConvertible,
                                 method: method,
                                 parameters: parameters,
                                 encoding: encoding,
                                 headers: headers).response(completionHandler: completionHandler)
    }

    func makeRequest(_ urlRequest: URLRequest, completionHandler: @escaping (AFDataResponse<Data?>) -> Void) {
        alomafireSession.request(urlRequest).response(completionHandler: completionHandler)
    }
}
