//
//  BaseService.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import Foundation
import Alamofire
import Combine

public class BaseService {
    static func request<T: Decodable, E: Error>(
        url: URL,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil
    ) -> Future<T, E> {
        return Future({ promise in
            ApiManager.sharedInstance.manager.request(
                url,
                method: method,
                parameters: parameters,
                encoding: URLEncoding.default
            ).responseDecodable{ (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    promise(.success(value))
                case .failure(let error):
                    promise(.failure( NSError(domain: error.destinationURL?.absoluteString ?? "", code: error.responseCode ?? 0) as! E)
                    )
                }
            }
        })
    }

}




