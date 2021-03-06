//
//  NetworkHelper.swift
//  AC-iOS-EpisodesFromOnline-HW
//
//  Created by C4Q on 12/2/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL
    case codingError(rawError: Error)
    case notAnImage
}


class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with url: URL,
                         completionHandler: @escaping ((Data) -> Void),
                         errorHandler: @escaping ((Error) -> Void)) {
        
        self.urlSession.dataTask(with: url){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
            }
            }.resume()
    }
}
