//
//  CircluarProfileImageView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct CircluarProfileImageView: View {
    
    var dummyImage: String = "elon"
    var showFollowButton: Bool = true
    
    var body: some View {
        
        Image(dummyImage)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
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
                    .opacity(showFollowButton ? 1: 0)
                
            )
    }
}

#Preview {
    CircluarProfileImageView()
}
