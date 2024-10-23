//
//  DataModel.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import Foundation
import SwiftData

enum Status: String, Codable, CaseIterable,Identifiable {
    case pending = "Pendiente"
    case inProgress = "En progreso"
    case finished = "Terminada"
    
    var id: Self { self }
}

@Model
final class Works {
    var id: UUID
    var name: String
    var descriptionWork: String
    var createdAt: Date
    var status: Status
    
    init(id: UUID, name: String, description: String, createdAt: Date, status: Status) {
        self.id = id
        self.name = name
        self.descriptionWork = description
        self.createdAt = createdAt
        self.status = status
    }
}
