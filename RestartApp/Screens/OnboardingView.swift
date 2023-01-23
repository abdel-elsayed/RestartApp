//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/18/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive = true
    @State var isAnimating = false
    
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
                .offset(y: isAnimating ? 0 : -40)
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 1), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }
                //MARK: - Center
                CenterDraggableImage(image: Image("character-1"))
                
                Spacer()
                //MARK: - Footer
                CustomDraggableButton(completion: {
                    DispatchQueue.main.async {
                        withAnimation(Animation.easeOut(duration: 0.4)) {
                            isOnboardingActive = false
                        }
                    }
                },
                                      text: "Get Started",
                                      color: Color("ColorRed"))
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
