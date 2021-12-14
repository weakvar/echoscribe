//
//  NetworkClient.swift
//  Echoscribe
//
//  Created by Vladislav Len on 07.12.2021.
//

import Foundation

final class NetworkClient {
    
    // MARK: - Types
    
    typealias CompletionBlock = (Result<Data, Error>) -> Void
    
    // MARK: - Private Properties
    
    private let session: URLSession
    private let baseUrl: URL
    
    // MARK: - Initializers
    
    init(session: URLSession = .shared, baseUrl: URL) {
        self.session = session
        self.baseUrl = baseUrl
    }
    
    // MARK: - Public Methods
    
    func request(options: RequestOptions, completion: @escaping CompletionBlock) {
        guard let request = options.request(baseUrl: baseUrl) else { return }
        
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
