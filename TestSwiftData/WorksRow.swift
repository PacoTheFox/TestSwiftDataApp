//
//  WorksRow.swift
//  TestSwiftData
//
//  Created by Francisco Aguirre San Román on 22/10/24.
//

import SwiftUI

struct WorksRow: View {
    let works: Works
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(works.name)
                .font(.headline)
            
            HStack {
                Text(works.createdAt.formatted(date: .long, time: .omitted))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(works.status.rawValue)
                    .foregroundStyle(.secondary)
                
            }
        }
    }
}
