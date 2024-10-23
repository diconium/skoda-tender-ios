import Foundation
import Alamofire

struct StatusDataSourceImpl: StatusDataSource {

    func getCarStatus(completionHandler: @escaping NetworkDataResponseHandler) {
        AF.request(Constants.API.baseURL)
            .cacheResponse(using: .cache)
            .redirect(using: .follow)
            .responseDecodable(of: StatusDataModel.self, completionHandler: completionHandler)
    }
}

