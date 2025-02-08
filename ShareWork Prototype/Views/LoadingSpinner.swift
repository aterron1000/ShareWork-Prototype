//
//  Loading_SpinningCircle.swift
//  Blackbook Access
//
//  Created by Christian Terron Garcia on 26/12/22.
//

import SwiftUI

struct Loading_Spinner: View {
    let rotationTime: Double = 0.75
    let animationTime: Double = 1.9
    let fullRotation: Angle = .degrees(360)
    static let initialDegree: Angle = .degrees(270)
    
    @State var spinnerStart: CGFloat = 0.0
    @State var spinnerEndS1: CGFloat = 0.03
    @State var spinnerEndS2S3: CGFloat = 0.03
    
    @State var rotationDegreeS1 = initialDegree
    @State var rotationDegreeS2 = initialDegree
    @State var rotationDegreeS3 = initialDegree
    @State var description: String = ""
    var size: CGFloat = 200
    var thickness: CGFloat = 20
    var body: some View {
        VStack{
            ZStack{
                Loading_SpinningCircle(start: spinnerStart, end: spinnerEndS2S3, rotation: rotationDegreeS3, color: .orange, thickness: thickness)
                
                Loading_SpinningCircle(start: spinnerStart, end: spinnerEndS2S3, rotation: rotationDegreeS2, color: .blue, thickness: thickness)
                //S1
                Loading_SpinningCircle(start: spinnerStart, end: spinnerEndS1, rotation: rotationDegreeS1, color: .purple, thickness: thickness)
            }
            .frame(width: size, height: size)
            .onAppear() {
                self.animateSpinner()
                Timer.scheduledTimer(withTimeInterval: animationTime, repeats: true) {(mainTimer) in
                    self.animateSpinner()
                }
            }
            if(!description.isEmpty) {
                Text(description)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top)
            }
            
        }
        
    }
    
    func animateSpinner(with duration: Double, completion: @escaping(() -> Void)) {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            withAnimation(Animation.easeInOut(duration: rotationTime)) {
                completion()
            }
        }
    }
    
    func animateSpinner() {
        animateSpinner(with: rotationTime) { self.spinnerEndS1 = 1.0}
        
        animateSpinner(with: (rotationTime *  2) - 0.025) {
            self.rotationDegreeS1 += fullRotation
            self.spinnerEndS2S3 = 0.8
        }
        
        animateSpinner(with: (rotationTime * 2)) {
            self.spinnerEndS1 = 0.03
            self.spinnerEndS2S3 = 0.03
        }
        
        animateSpinner(with: (rotationTime * 2) + 0.0525) { self.rotationDegreeS2 += fullRotation }

        animateSpinner(with: (rotationTime * 2) + 0.225) { self.rotationDegreeS3 += fullRotation }
        
    }
}

struct Loading_SpinningCircle: View {
    var start: CGFloat
    var end: CGFloat
    var rotation: Angle
    var color: Color
    var thickness: CGFloat = 20
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: start, to: end)
                .stroke(style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .fill(color)
                .rotationEffect(rotation)
        }
    }
}

struct Loading_SpinningCircle_Previews: PreviewProvider {
    static var previews: some View {
        Loading_Spinner()
    }
}
