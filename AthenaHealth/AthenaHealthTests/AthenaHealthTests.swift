//
//  AthenaHealthTests.swift
//  AthenaHealthTests
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import XCTest
@testable import AthenaHealth

final class AthenaHealthTests: XCTestCase {
    var viewModel: TodoViewModel!
    
    override func setUp() {
            super.setUp()
            viewModel = TodoViewModel()
        }

        override func tearDown() {
            viewModel = nil
            super.tearDown()
        }
    
    func testFetchToDos() {
            let mockToDos: [TodoModel] = [
                TodoModel(id: 1, userId: 1, title: "Buy groceries", completed: false),
                TodoModel(id: 2, userId: 2, title: "Walk the dog", completed: true)
            ]
            viewModel.todos = mockToDos
            XCTAssertEqual(viewModel.todos.count, 2)
            XCTAssertEqual(viewModel.todos.first?.title, "Buy groceries")
        }
    func testSaveToDosToUserDefaults() {
            let mockToDos: [TodoModel] = [
                TodoModel(id: 1, userId: 1, title: "Buy groceries", completed: false)
            ]
            UserDefaults.standard.savedToDos = mockToDos
            let savedToDos = UserDefaults.standard.savedToDos
            XCTAssertEqual(savedToDos.count, 1)
            XCTAssertEqual(savedToDos.first?.title, "Buy groceries")
        }
    
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
