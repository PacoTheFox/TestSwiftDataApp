//
//  NewWorksView.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import SwiftUI

struct NewWorksView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    @State private var status: Status = .pending
    
    var body: some View {
        NavigationStack{
            Form {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        Text("Works Name")
                            .font(.headline)
                        TextField("Enter the name of the work", text: $name)
                            .padding()
                            .autocapitalization(.none)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Works Description")
                            .font(.headline)
                        TextField("Enter the description of the work", text: $description)
                            .padding()
                    }
                    
                    DatePicker(selection: $date, displayedComponents: .date){
                        Text("Fecha de la Tarea")
                    }
                    
                    Picker(selection: $status) {
                        ForEach(Status.allCases) { status in
                            Text(status.rawValue)
                        }
                    } label: {
                        Text("Seleccione estado")
                    }
                }
            }
            .textFieldStyle(.roundedBorder)
            .navigationTitle("New Work")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newWork = Works(id: UUID(),name: name, description: description, createdAt: date, status: status)
                        context.insert(newWork)
                        dismiss()
                    } label: {
                        Text("Confirm")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        
                        Text("Cancel")
                    }
                }
                
            }
        }
    }
}

#Preview(traits: .sampleData) {
    NewWorksView()
}
