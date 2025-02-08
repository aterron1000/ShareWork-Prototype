//
//  Database.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct Database: View {
    var body: some View {
        List {
            Section (header: Text("Fall 2024"), content: {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 1")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Information Technologies")
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 2")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Information Technologies")
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 3")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Strategic Management")
                        .foregroundStyle(.secondary)
                }
                
            })
            
            Section (header: Text("Spring 2025"), content: {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 1")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Information Technologies")
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 2")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Information Technologies")
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document")
                        Text("Project 3")
                    }.font(.headline)
                    Text("Description of the project and details.")
                        .foregroundStyle(.secondary)
                    Text("IS 1234 Strategic Management")
                        .foregroundStyle(.secondary)
                }
                
            })
        }
        .navigationTitle("My Projects")
        .toolbar {
            Button(action:  {
                
            }, label: {
                HStack {
                    Image(systemName: "cloud")
                    Text("Upload")
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        Database()
    }
}
