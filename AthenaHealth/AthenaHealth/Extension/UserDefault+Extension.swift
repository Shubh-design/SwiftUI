//
//  UserDefault+Extension.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let todos = "todos"
    }
    
    var savedToDos: [TodoModel] {
        get {
            if let data = data(forKey: Keys.todos) {
                return (try? JSONDecoder().decode([TodoModel].self, from: data)) ?? []
            }
            return []
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            set(data, forKey: Keys.todos)
        }
    }
}
