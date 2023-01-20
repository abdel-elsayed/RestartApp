//
//  HomeView.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/18/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive = true
    
    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                CircleRingView(shapeColor: .gray, shapeOpacity: 0.2)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
            Button {
                isOnboardingActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
