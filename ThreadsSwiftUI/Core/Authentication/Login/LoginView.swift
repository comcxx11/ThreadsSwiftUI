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
                    // TODO: Login..
                })
                
                Spacer()
                
                Divider()
                
                createAccountButton
            }
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
            Text("RegistrationView")
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
