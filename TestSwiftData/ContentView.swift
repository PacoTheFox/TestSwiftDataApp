//
//  ContentView.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query private var works: [Works]
    @State private var showAddWork: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                if works.isEmpty {
                    ContentUnavailableView("No works to show", systemImage: "list.bullet.clipboard",
                                           description: Text("Add a work to see it here"))
                } else {
                    main
                }
            }
            .navigationTitle("Works")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showAddWork.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }

        
        .sheet(isPresented: $showAddWork) {
            NewWorksView()
        }
        
    }
    
    var main: some View {
        List{
            ForEach(works) { works in
                WorksRow(works: works)
            }
            .onDelete { index in
                if let v = index.first {
                    context.delete(works[v])
                }
                
            }
        }
        
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}


