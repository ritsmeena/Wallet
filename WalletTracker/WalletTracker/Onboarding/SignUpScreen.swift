//
//  SignUpScreen.swift
//  WalletTracker
//
//  Created by Ritika Meena on 09/07/24.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var nameTextField: String = ""
    @State private var emailTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var termsAndCondBox: Bool = false
    
    var body: some View {
        VStack {
            CustomTextField(customTextFieldPlaceholder: "Name", customTextField: $nameTextField)
            CustomTextField(customTextFieldPlaceholder: "Email", customTextField: $emailTextField)
            PasswordTextfield(passwordTextField: $passwordTextField)
            HStack {
                Image(systemName: termsAndCondBox ? "checkmark.square.fill" : "square")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        termsAndCondBox.toggle()
                    }
                Text("By signing up, you agree to the Terms of Service and Privacy Policy")                    .font(.custom("Inter-Regular", size: 14))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal,16)
            
            NavigationLink(destination: SignUpScreen()) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.custom("Inter-Medium", size: 18))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(16)
            }
            .padding(.horizontal,16)
        }
        .navigationBarTitle("Sign Up")
    }
}

struct CustomTextField : View {
    @State var customTextFieldPlaceholder: String = ""
    @Binding var customTextField: String


    var body: some View {
        VStack {
            HStack {
                TextField(customTextFieldPlaceholder, text: $customTextField)
            }
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .border( Color(red: 241/255, green: 241/255, blue: 250/255))
            .frame(height: 54)
        }
        .padding(.vertical,12)
        .padding(.horizontal,16)
    }
}

struct PasswordTextfield : View {
    
    @Binding var passwordTextField: String
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack {
            HStack {
                if isPasswordVisible {
                    TextField("Password", text: $passwordTextField)
                } else {
                    SecureField("Password", text: $passwordTextField)
                }
                Button(action: {
                    self.isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .padding(.horizontal, 10)
                }
                .foregroundColor(.gray)
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .border(Color(red: 241/255, green: 241/255, blue: 250/255))
            .frame(height: 54)
        }
        .padding(.vertical,12)
        .padding(.horizontal,16)
    }
}

#Preview {
    SignUpScreen()
}
