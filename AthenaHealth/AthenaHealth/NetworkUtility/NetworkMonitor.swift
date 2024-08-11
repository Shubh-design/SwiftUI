//
//  NetworkMonitor.swift
//  AthenaHealth
//
//  Created by Shubham Jaiswal on 11/08/24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject{
    private var monitor: NWPathMonitor
       private var queue = DispatchQueue.global()
       
       @Published var isConnected: Bool = true
       
       init() {
           monitor = NWPathMonitor()
           monitor.pathUpdateHandler = { [weak self] path in
               DispatchQueue.main.async {
                   self?.isConnected = path.status == .satisfied
               }
           }
           monitor.start(queue: queue)
       }
}
