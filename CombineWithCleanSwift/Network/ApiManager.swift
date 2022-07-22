//
//  ApiManager.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import Foundation
import Alamofire

open class ApiManager {

    struct Shared {
        static var instance: ApiManager?
    }
    open class var sharedInstance: ApiManager {
        if Shared.instance == nil {
            Shared.instance = ApiManager()
        }
        return Shared.instance!
    }

    let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 150
        configuration.timeoutIntervalForRequest  =  150
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        var headers: Parameters = [:]
        headers["Content-Type"] = "application/json; charset=utf-8"

        configuration.httpAdditionalHeaders = headers
        return Alamofire.Session(configuration: configuration, serverTrustManager: nil)
    }()
}

