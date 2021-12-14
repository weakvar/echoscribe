//
//  RequestOptions.swift
//  Echoscribe
//
//  Created by Vladislav Len on 07.12.2021.
//

import Foundation

struct RequestOptions {
    
    // MARK: - Public Properties
    
    let path: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    
    // MARK: - Public Methods
    
    func request(baseUrl: URL) -> URLRequest? {
        let url = baseUrl.appendingPathComponent(path)
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return nil }
        
        if method == .get || method == .delete {
            urlComponents.queryItems = self.queryItems
        }
        
        guard let requestUrl = urlComponents.url else { return nil }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.rawValue
        
        if method == .post || method == .put || method == .patch {
            request.httpBody = self.httpBody
        }
        
        return request
    }
    
}

// MARK: - Helpers

extension RequestOptions {
    
    private var queryItems: [URLQueryItem]? {
        if let parameters = self.parameters, parameters.count > 0 {
            return parameters.map { (key, value) in
                return URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        return nil
    }
    
    private var httpBody: Data? {
        if let parameters = self.parameters, parameters.count > 0 {
            return try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        return nil
    }
    
}
