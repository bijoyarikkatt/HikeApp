//
//  CardView.swift
//  Hike
//
//  Created by Bijoy A B on 04/11/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROERTIES
    
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowigSheet : Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImages(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        Spacer()
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was pressed")
                            isShowigSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowigSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friedns and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayLight)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK: - FOOTER
                Button{
                    // ACTION: Generate a random number
                    randomImages()
                    
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
