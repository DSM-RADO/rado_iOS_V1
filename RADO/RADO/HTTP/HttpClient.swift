import Foundation
import Alamofire

class HTTPClient {
    let baseURL = "http://192.168.1.28:8080"
    
    func get(url: String, parmas: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: parmas,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func post(url: String, parmas: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .post,
                          parameters: parmas,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
    
    func delete(url: String, parmas: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .delete,
                          parameters: parmas,
                          encoding: JSONEncoding.prettyPrinted,
                          headers: header,
                          interceptor: nil)
    }
}
