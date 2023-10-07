//
//  UserProfileView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            header
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            UserContentListView(user: user)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension UserProfileView {
    
    var header: some View {
        VStack(spacing: 14 ) {
            
            ProfileHeaderView(user: user)
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(.black)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    UserProfileView(user: PreviewProvider.shared.user)
}
