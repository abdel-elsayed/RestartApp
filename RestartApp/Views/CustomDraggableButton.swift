//
//  CustomDraggableButton.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/19/23.
//

import SwiftUI

struct CustomDraggableButton: View {
    @AppStorage("onboarding") var isOnboardingActive = true

    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State var buttonOffset: CGFloat = 0
    @State var text: String
    @State var color: Color
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white.opacity(0.2))
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(8)
            
            Text(text)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            backgroundColor

            HStack {
                draggableButton
                .offset(x: buttonOffset)
                .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width > 0 && gesture.translation.width <= buttonWidth - 80 {
                            buttonOffset = gesture.translation.width
                        }
                    })
                    .onEnded({ _ in
                        if buttonOffset > buttonWidth / 2 {
                            buttonOffset = buttonWidth - 80
                            isOnboardingActive = false
                        } else {
                            buttonOffset = 0
                        }
                    })
                )
                Spacer()
            }
        }.frame(width: buttonWidth, height: 80, alignment: .center)
            .padding()
    }
    
    @ViewBuilder var backgroundColor: some View {
        HStack {
            Capsule()
                .fill(color)
            .frame(width: buttonOffset + 80)
            Spacer()
        }
    }
    
    @ViewBuilder var draggableButton: some View {
        ZStack {
            Circle()
                .fill(color)
            Circle()
                .fill(.black.opacity(0.2))
                .padding(8)
            Image(systemName: "chevron.right.2")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct CustomDraggableButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
            CustomDraggableButton(text: "Get Started", color: Color("ColorRed"))
            }
    }
}
