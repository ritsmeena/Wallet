//
//  ViewCoordinator.swift
//  WalletTracker
//
//  Created by Ritika Meena on 09/07/24.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            ContentView()
        }else {
            SplashScreen(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
