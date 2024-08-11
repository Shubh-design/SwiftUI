//
//  TodoDetailView.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: TodoModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
               Text("User ID: \(todo.userId)")
                   .font(.subheadline)
               
               Text("ToDo ID: \(todo.id)")
                   .font(.subheadline)
               
               Text("Title: \(todo.title)")
                   .font(.subheadline)
               
            Text(todo.completed ? StringConstant.completedTrue.rawValue : StringConstant.completedFalse.rawValue)
                   .foregroundColor(todo.completed ? .green : .red)
                   .font(.subheadline)
               
               Spacer()
           }
           .padding()
           .navigationTitle(todo.title)
       }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTodo = TodoModel(id: 1, userId: 3, title: "Buy groceries", completed: false)
        TodoDetailView(todo: sampleTodo)
    }
}
