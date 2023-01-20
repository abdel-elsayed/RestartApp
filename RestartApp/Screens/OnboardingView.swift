//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/18/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive = true
    
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                Spacer()
                //MARK: - Header
                VStack {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                         Its not how much we give but
                         its how much love we put into it.
                         """)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                }
                //MARK: - Center
                ZStack {
                    CircleRingView(shapeColor: .white,
                                   shapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                //MARK: - Footer
              CustomDraggableButton(text: "Get Started",
                                    color: Color("ColorRed"))
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
