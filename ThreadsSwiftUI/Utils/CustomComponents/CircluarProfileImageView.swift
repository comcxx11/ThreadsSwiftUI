//
//  CircluarProfileImageView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: 28
        case .xSmall: 32
        case .small: 40
        case .medium: 48
        case .large: 64
        case .xLarge: 80
        }
    }
}

struct CircluarProfileImageView: View {
    
    var user: User?
    var size: ProfileImageSize = .small
    var showFollowIcon = false
    var body: some View {
        
        Group {
            if let profileImageUrl = user?.profileImageUrl {
                KFImage(URL(string: profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: size.dimension, height: size.dimension)
                    .foregroundColor(Color(.systemGray4))
            }
        }
        .overlay(
            // TODO: 未フォローの場合だけ表示
            Image(systemName: "plus")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.all, 5)
                .background(Color.black)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .offset(x: 13, y: 13)
                .opacity(showFollowIcon ? 1: 0)
        )
    }
}

#Preview {
    CircluarProfileImageView()
}
