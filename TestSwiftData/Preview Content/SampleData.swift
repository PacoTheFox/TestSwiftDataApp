//
//  SampleData.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Works.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let tarea1 = Works(id: UUID(), name: "Realizar tarea", description: "Práctica aprendiendo a utilizar Swift Data", createdAt: .now, status: .inProgress)
        let tarea2 = Works(id: UUID(), name: "Terminar pantalla de Contactless", description: "Terminar desarollo pantalla de contacless para la aplicación unigis deliveries", createdAt: .now, status: .finished)
        
        
        container.mainContext.insert(tarea1)
        container.mainContext.insert(tarea2)
        
        return container
    }
    
    func body(content: Content,context: ModelContainer) -> some View {
        content.modelContainer(context)
        
    }
}


extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
