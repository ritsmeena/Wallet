//
//  SplashScreen.swift
//  WalletTracker
//
//  Created by Ritika Meena on 09/07/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(Color.accentColor)
                .edgesIgnoringSafeArea(.all)
            
            Ellipse()
                .fill(Color(red: 0.988, green: 0.675, blue: 0.071))
                .blendMode(.overlay)
                .frame(width: 74, height: 74)
                .blur(radius: 16)
                .padding(.leading,118)
                .scaleEffect(scale)
            
            Text("wallet")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .font(.custom("Inter-Bold", size: 56))
                .lineSpacing(1.0)
                .scaleEffect(scale)
            
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.7)) {
                self.scale = 0.9
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

