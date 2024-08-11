//
//  MockNetworkServiceTest.swift
//  AthenaHealthTests
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import XCTest
import Combine
@testable import AthenaHealth

class MockNetworkService: NetworkService {
    var todos: [TodoModel] = [
        TodoModel(id: 1, userId: 1, title: "Buy groceries", completed: false),
        TodoModel(id: 2, userId: 2, title: "Walk the dog", completed: true)
    ]
    
    func fetch<T>(from endpoint: APIEndpoint) -> AnyPublisher<T, Error> where T : Decodable {
        return Just(todos as! T)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class ToDoViewModelTests: XCTestCase {
    func testFetchToDos() {
        let mockNetworkService = MockNetworkService()
        let viewModel = TodoViewModel(networkService: mockNetworkService)
        
        XCTAssertEqual(viewModel.todos.count, 2)
        XCTAssertEqual(viewModel.todos.first?.title, "Buy groceries")
    }
}
