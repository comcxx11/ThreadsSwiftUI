//
//  LoginView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel
    
    init() {
        _viewModel = .init(wrappedValue: LoginViewModel())
    }
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer()
                // 複数のViewで使われているため、extension化
                appIcon
                
                inputForm
                
                forgotPassword
                
                AuthButton(buttonText: "Login", action: {
                    Task {
                        try await viewModel.login()
                    }
                })
                
                Spacer()
                
                Divider()
                
                createAccountButton
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.error?.localizedDescription ?? "Unknown Error"),
                      dismissButton: .default(Text("OK"), action: { viewModel.alertOkButtonTapped() }))
            })
        }
    }
}

extension LoginView {
    var inputForm: some View {
        Group {
            TextField("Email", text: $viewModel.loginModel.email)
            SecureField("Password", text: $viewModel.loginModel.password)
        }
        .modifier(TextFieldModifier())
    }
    
    var forgotPassword: some View {
        NavigationLink {
            Text("Forgot Password View")
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical)
                .padding(.trailing, 28)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    var createAccountButton: some View {
        NavigationLink {
            RegisterView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack(spacing: 3) {
                Text("Don't have an account")
                Text("Sign Up")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.primary)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    LoginView()
}
