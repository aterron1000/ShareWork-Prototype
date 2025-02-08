//
//  EmployerView.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct EmployerView: View {
    @State private var isContactPresent = false
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text("Name of the student")
                    .font(.system(size: 64, weight: .bold))
                Spacer()
                
                Button(action: {
                    isContactPresent = true
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 280, height: 80)
                            .gradientForeground(colors: [.red, .blue, .purple])
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text("Contact")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .bold))
                    }
                })
            }
        }.padding()
        Form {
            Section(header: Text("Details"), content: {
                Text("Brief description of the student Lorem ipsum odor amet, consectetuer adipiscing elit. Convallis erat feugiat facilisis faucibus tempor dapibus conubia. Suscipit ex integer netus potenti eros. Ullamcorper nunc sed libero viverra, tincidunt maximus per. At consequat id proin finibus dapibus dis. Torquent vestibulum consequat mollis dolor per netus phasellus scelerisque aliquam. Molestie condimentum sodales ullamcorper consequat mauris eu ullamcorper. Fusce tincidunt a blandit parturient vel.")
            })
            
            Section(header: Text("Relevant Project 1"), content:  {
                Text("Strategic Management Project").font(.headline)
                Text("Detail of project and bulletpoint")
                Text("Detail of project and bulletpoint 2")
            })
            
            Section(header: Text("Relevant Project 2"), content:  {
                Text("Development of science").font(.headline)
                Text("Detail of project and bulletpoint")
                Text("Detail of project and bulletpoint 2")
            })
            
            Section(header: Text("Education"), content:  {
                VStack(alignment: .leading) {
                    Text("University of Texas at San Antonio - Master in Information Technologies")
                    Text("19 August 2022 to 20 May 2025")
                        .foregroundStyle(.secondary)
                }
                VStack(alignment: .leading) {
                    Text("University of Texas at San Antonio - Master in Computer Science")
                    Text("19 August 2020 to 20 May 2022")
                        .foregroundStyle(.secondary)
                }
            })
            
        }
        .sheet(isPresented: $isContactPresent, content: {
            NavigationStack {
                List {
                    Text("Email: emailStudent@my.utsa.edu")
                    Text("Phone: 123-123-1234")
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "paperplane")
                            Text("Send email with your employment details.")
                        }
                        
                    })
                }
                .navigationTitle("Contact Details")
            }
        })
    }
}

#Preview {
    EmployerView()
}
