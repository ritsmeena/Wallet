//
//  OnboardingScreen.swift
//  WalletTracker
//
//  Created by Ritika Meena on 09/07/24.
//

import SwiftUI
import Foundation

struct OnboardingScreen: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Spacer()
                DynamicOnboardingView()
                    .padding(.top,32)
                    .frame(height: 453)
                Spacer()
                OnboardingActionView()
                    .padding(.bottom,8)
            }
        }
    }
}

fileprivate struct DynamicOnboardingView : View {
    
    private var onboardingImage = ["Onboarding1","Onboarding2","Onboarding3"]
    private var onboardingTitle = ["Gain total control of your money","Know where your money goes","Planning ahead"]
    private var onboardingSubTitle = ["Become your own money manager and make every cent count","Track your transaction easily, with categories and financial report ","Setup your budget for each category so you are in control"]
    
    @State private var isAutoDragging = false
    @State private var currentPage = 0
    
    var body: some View {
        
        VStack(alignment: .center){
            VStack(alignment: .center){
                Image(onboardingImage[currentPage])
                    .frame(width: 312,height: 312)
                
                Text(onboardingTitle[currentPage])
                    .font(.custom("Inter-SemiBold", size: 32))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top,41)
                    .padding(.horizontal,49)
                
                Text(onboardingSubTitle[currentPage])
                    .font(.custom("Inter-Light", size: 16))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 272)
                    .padding(.top,5)
                    .padding(.horizontal,51)
            }
            PageIndicator(numberOfPages: 3, currentPageIndex: currentPage)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.isAutoDragging = false
                }
                .onEnded { value in
                    if value.translation.width < 0 {
                        if self.currentPage < 2 {
                            self.currentPage += 1
                        }
                    } else if value.translation.width > 0 {
                        if self.currentPage > 0 {
                            self.currentPage -= 1
                        }
                    }
                }
        )
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                self.isAutoDragging = true
                self.autoSwipe()
            }
        }
    }
    
    private func autoSwipe() {
        if self.isAutoDragging {
            if self.currentPage < 2 {
                self.currentPage += 1
            } else {
                self.currentPage = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.autoSwipe()
            }
        }
    }
}

fileprivate struct OnboardingActionView: View {
    var body: some View {
        VStack(spacing: 16){
            NavigationLink(destination: SignUpScreen()) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.custom("Inter-Medium", size: 18))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(16)
            }
            .padding(.horizontal,20)
            
            NavigationLink(destination: LoginScreen()) {
                Text("Login")
                    .foregroundColor(.accentColor)
                    .font(.custom("Inter-Medium", size: 18))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("AccentLightColor"))
                    .cornerRadius(16)
            }
            .padding(.horizontal,20)
        }
    }
}

struct PageIndicator: View {
    var numberOfPages: Int
    var currentPageIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPageIndex ? .accentColor : Color("AccentLightColor"))
                    .frame(width: index == currentPageIndex ? 16 : 8, height: index == currentPageIndex ? 16 : 8)
            }
        }
        .frame(height: 16)
    }
}

#Preview {
    OnboardingScreen()
}
