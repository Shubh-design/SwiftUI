//
//  NetworkService.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation
import Combine

protocol NetworkService {
    func fetch<T: Decodable>(from endpoint: APIEndpoint) -> AnyPublisher<T, Error>
}

class URLSessionNetworkService: NetworkService {
    
    func fetch<T: Decodable>(from endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        guard let url = endpoint.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
