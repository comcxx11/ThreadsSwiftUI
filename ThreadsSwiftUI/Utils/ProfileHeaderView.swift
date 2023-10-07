//
//  ProfileHeaderView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("フォロワー50万人")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            CircluarProfileImageView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: PreviewProvider.shared.user)
}
