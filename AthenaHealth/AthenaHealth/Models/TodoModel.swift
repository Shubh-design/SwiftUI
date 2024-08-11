//
//  TodoModel.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}
