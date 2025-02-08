//
//  ShareWork.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct ShareWork: View {
    @State private var text: String = ""
    @State private var isCreateViewPresent: Bool = false
    @State private var pageNumber = ["1", "2", "3", "4", "5", "6"]
    @State private var selectedNumber: String = "1"
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Employment Details"), content: {
                    HStack {
                        Text("Employment Details")
                            .font(.headline)
                        TextField("Write the employment details", text: $text)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "list.bullet.clipboard")
                            Text("Paste from clipboard")
                                .font(.headline)
                        }
                    })
                })
                
                Section(header: Text("Settings"), content: {
                    HStack {
                        Text("Highlights")
                            .font(.headline)
                        TextField("What would you like to highlight for your employer?", text: $text)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Amount of pages")
                            .font(.headline)
                        Picker("Number of pages", selection: $selectedNumber) {
                            ForEach(pageNumber, id: \.self) { flavor in
                                   Text(flavor)
                               }
                           }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                })
            }
            Button(action: {
                isCreateViewPresent = true
            }, label: {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 100)
                        .gradientForeground(colors: [.red, .blue, .purple, .orange])
                    
                    HStack {
                        Image(systemName: "text.badge.star")
                        Text("ShareWork")
                            
                    }
                    .foregroundStyle(.white)
                    .font(.system(size: 48, weight: .bold))
                }
            })
            
        }
        .navigationTitle("ShareWork")
        .sheet(isPresented: $isCreateViewPresent, content: {
            CreateSummary()
        })
    }
}

#Preview {
    NavigationStack {
        ShareWork()
    }
}
