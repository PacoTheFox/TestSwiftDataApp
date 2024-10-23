//
//  Item.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
