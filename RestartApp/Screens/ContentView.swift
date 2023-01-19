//
//  ContentView.swift
//  RestartApp
//
//  Created by Abdelrahman Elsayed on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive = true
    
    var body: some View {
        VStack {
            if isOnboardingActive {
                OnboardingView()
            } else {
                HomeView()
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
