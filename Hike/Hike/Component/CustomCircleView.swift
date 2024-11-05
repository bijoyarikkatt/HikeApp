//
//  CustomCircleView.swift
//  Hike
//
//  Created by Bijoy A B on 05/11/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGraditent : Bool = false
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGraditent ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGraditent ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGraditent.toggle()
                    }
                }
            MotionAniationView()
        } //: ZSTACK
        .frame(width: 256, height: 256)
        

    }
}

#Preview {
    CustomCircleView()
}
