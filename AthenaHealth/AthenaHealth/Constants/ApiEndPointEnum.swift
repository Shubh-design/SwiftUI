//
//  ApiEndPointEnum.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation

enum APIEndpoint: String {
    case todos = "https://dummy-json.mock.beeceptor.com/todos"
    
    var url: URL? {
        return URL(string: self.rawValue)
    }
}
