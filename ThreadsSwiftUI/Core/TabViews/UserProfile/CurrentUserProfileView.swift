//
//  CurrentUserProfileView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel: CurrentUserProfileViewModel
    
    private var currentUser: User? {
        viewModel.currentUser
    }
    
    init() {
        _viewModel = .init(wrappedValue: CurrentUserProfileViewModel())
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                header
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                UserContetntListView()
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
        }
    }
    
}

extension CurrentUserProfileView {
    
    var header: some View {
        VStack(spacing: 14 ) {
            
            ProfileHeaderView(user: currentUser)
            
            HStack(spacing: 14) {
                Button {
                    viewModel.showEditProfile = true
                } label: {
                    Text("プロフィールを編集")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 1)
                        )
                }
                
                Button {
                    
                } label: {
                    Text("プロフィールをシェア")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
