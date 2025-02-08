//
//  ContentView.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: EmptyView(), label: {
                    HStack {
                        Image(systemName: "person.circle")
                        Text("Account")
                    }
                })
                NavigationLink(destination: UploadProject(), label: {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("Upload coursework")
                   }
                })
                
                NavigationLink(destination: Database(), label: {
                    HStack {
                        Image(systemName: "cloud")
                        Text("My Projects")
                    }
                })
                NavigationLink(destination: ShareWork(), label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("ShareWork")
                            
                    }
                    .gradientForeground(colors: [.green, .blue, .purple])
                })
                
                Spacer()
                NavigationLink(destination: EmployerView(), label: {
                    HStack {
                        Image(systemName: "hammer.fill")
                        Text("Employer Perspective")
                            
                    }
                })
            }
            .font(.headline)
            .navigationTitle("ShareWork")
        } detail: {
            ShareWork()
        }
        
    }
}

#Preview {
    ContentView()
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
            .mask(self)
    }
}
