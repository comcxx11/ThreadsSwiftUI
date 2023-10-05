//
//  RegisterationView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel: RegisterViewModel
    @Environment(\.dismiss) var dismiss
    
    init() {
        _viewModel = .init(wrappedValue: RegisterViewModel())
    }
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Spacer()
                
                appIcon
                
                inputForm
                
                AuthButton(buttonText: "Sign Up") {
                    Task {
                        try await viewModel.createUser()
                    }
                }
                .padding()
                .alert(isPresented: $viewModel.showAlert, content: {
                    Alert(title: Text("Error"),
                          message: Text(viewModel.error?.localizedDescription ?? "Unknown Error"),
                          dismissButton: .default(Text("OK"), action: { viewModel.alertOkButtonTapped() }))
                })
                
                Spacer()
                
                Divider()
                
                goLoginButton
            }
        }
    }
}

extension RegisterView {
    var inputForm: some View {
        Group {
            TextField("Email", text: $viewModel.model.email)
            TextField("username", text: $viewModel.model.username)
            TextField("fullname", text: $viewModel.model.fullName)
            TextField("password", text: $viewModel.model.password)
        }
        .modifier(TextFieldModifier())
        .padding(.vertical, 2)
    }
    
    var goLoginButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3) {
                Text("Already have an account")
                Text("Sign In")
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.primary)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    RegisterView()
}
