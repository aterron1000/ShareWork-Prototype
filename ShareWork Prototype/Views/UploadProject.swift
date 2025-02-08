//
//  UploadProject.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct UploadProject: View {
    @State private var text: String = ""
    @State private var text2: String = ""
    @State private var date1: Date = Date()
    var body: some View {
        Form {
            Section(header: Text("Project"), content: {
                HStack {
                    Text("Project Name: ")
                    TextField("Your project name", text: $text)
                }.font(.system(size: 16, weight: .bold))
                HStack {
                    Text("Project Description: ")
                    TextField("Write a brief description", text: $text2)
                }.font(.system(size: 16, weight: .bold))
               
            })
            
            Section(header: Text("Details"), content: {
                DatePicker("Start Date", selection: $date1, displayedComponents: .date).font(.system(size: 16, weight: .bold))
                    
                DatePicker("End Date", selection: $date1, displayedComponents: .date).font(.system(size: 16, weight: .bold))
            })
            
            Section(header: Text("Upload"), content: {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image(systemName: "document.badge.plus.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        Text("Choose file")
                            .font(.title)
                        Spacer()
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    VStack {
                        Spacer()
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        Text("Select from Photo Library")
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                            .font(.title)
                        Spacer()
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    
                    Spacer()
                }.padding()
                
            })
        }
        .toolbar {
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "icloud.and.arrow.up")
                    Text("Upload now")
                }
            })
        }
        .navigationTitle(Text("Upload Project"))
    }
}

#Preview {
    NavigationStack {
        UploadProject()
    }
}
