//
//  MotionAniationView.swift
//  Hike
//
//  Created by Bijoy A B on 05/11/24.
//

import SwiftUI

struct MotionAniationView: View {
    // MARK: - PROPERTIES
    
    @State private var randomCircle : Int = Int.random(in: 6...12)
    @State private var isAnimating : Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. - RANDOM COORDINATE
    func randomCordinates() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    // 2. - RANDOM SIZE
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 4...80)
    }
    // 3. - RANDOM SCALE
    func randomScale() -> CGFloat{
        return CGFloat.random(in: 0.1...2.0)
    }
    // 4. - RANDOM SPEED
    func randomSpeed() -> CGFloat{
        return CGFloat.random(in: 0.05...1.0)
    }
    // 5. - RANDOM DELAY
    func randomdelay() -> Double{
        return  Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCordinates(),
                        y: randomCordinates()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomdelay())
                            ) {
                                isAnimating = true
                            }
                        
                        }
                    )
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAniationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
