//
//  ContentView.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var searchText = ""
    @ObservedObject private var networkMonitor = NetworkMonitor()
    
    var filteredToDos: [TodoModel] {
        if searchText.isEmpty {
            return viewModel.todos
        } else {
            return viewModel.todos.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if !networkMonitor.isConnected {
                    Text(StringConstant.OfflineMsg.rawValue)
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(filteredToDos) { todo in
                    NavigationLink(destination: TodoDetailView(todo: todo)) {
                        Text(todo.title) 
                    }
                }
                .navigationTitle(StringConstant.TodoList.rawValue)
                .searchable(text: $searchText)
                .refreshable {
                    viewModel.fetchToDos()
                }
                .onAppear {
                    viewModel.fetchToDos()
                }
            }
        }
    }
}

#Preview {
    ListView()
}
