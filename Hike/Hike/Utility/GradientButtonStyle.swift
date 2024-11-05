//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Bijoy A B on 05/11/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditinal statement with nil coalesing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When user pressed the button
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                            .customGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                :
                // B: When the button is not pressed
                LinearGradient(
                    colors: [
                        .customGrayLight,
                            .customGrayMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}
