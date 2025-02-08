//
//  CreateSummary.swift
//  ShareWork Prototype
//
//  Created by Christian Terron Garcia on 31/01/25.
//

import SwiftUI

struct CreateSummary: View {
    @State private var isFinished: Bool = false
    var body: some View {
        VStack {
            if (isFinished) {
                Group {
                    Image(systemName: "checkmark")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundStyle(.green)
                    Text("Summary Ready")
                        .font(.system(size: 48, weight: .bold))
                        .multilineTextAlignment(.center)
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 400, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .gradientForeground(colors: [.red, .blue, .purple])
                            
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                                    
                            }
                            .font(.system(size: 48, weight: .bold))
                            .foregroundStyle(.white)
                        }
                    })
                }.transition(.opacity)
            } else {
                
                Group {
                    Loading_Spinner()
                    Text("Creating your summary")
                        .font(.system(size: 48, weight: .bold))
                        .multilineTextAlignment(.center)
                }.transition(.scale)
            }
            
        }
        .animation(.easeInOut(duration: 0.5), value: isFinished)
        .task {
            await Task.sleep(seconds: 3)
            isFinished = true
        }
    }
}

#Preview {
    CreateSummary()
}


extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async {
        await withCheckedContinuation { continuation in
            _sleep(seconds: seconds) {
                continuation.resume()
            }
        }
    }
    
    private static func _sleep(seconds: Double, completion: @escaping(() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
