//
//  HomeView.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/18/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive = true
    
    @State private var isAnimating = false
    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                CircleRingView(shapeColor: .gray, shapeOpacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                    .offset(y: isAnimating ? -45 : 45)
                    .animation(Animation.easeInOut(duration: 3)
                        .repeatForever(),
                               value: isAnimating)
            }
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
            Button {
                DispatchQueue.main.async {
                    withAnimation(Animation.easeOut(duration: 0.4)) {
                        isOnboardingActive = true
                    }
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .onAppear {
                DispatchQueue.main.async {
                    isAnimating = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
