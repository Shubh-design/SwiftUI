//
//  TodoViewModel.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation
import Combine
class TodoViewModel: ObservableObject{
    @Published var todos: [TodoModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let networkMonitor = NetworkMonitor()
    private var networkService: NetworkService
    //Offline support
    init(networkService: NetworkService = URLSessionNetworkService()) {
            self.networkService = networkService
            todos = UserDefaults.standard.savedToDos
            networkMonitor.$isConnected
                .sink { [weak self] isConnected in
                    if isConnected {
                        self?.fetchToDos()
                    }
                }
                .store(in: &cancellables)
        }
        
        func fetchToDos() {
            
            networkService.fetch(from: .todos)
                       .sink(receiveCompletion: { completion in
                           switch completion {
                           case .finished:
                               break
                           case .failure(let error):
                               print("Error fetching ToDos: \(error)")
                           }
                       }, receiveValue: { [weak self] (todos: [TodoModel]) in
                           self?.todos = todos
                           UserDefaults.standard.savedToDos = todos 
                       })
                       .store(in: &cancellables)
               }
    
    
}
