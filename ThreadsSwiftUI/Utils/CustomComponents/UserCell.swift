//
//  UserCell.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(alignment: .top, spacing: 12) {
                CircluarProfileImageView(user: user)

                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(spacing: 0) {
                        Text(user.username)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)

                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundColor(Color(.systemBlue))
                            .offset(y: 1)
                            .padding(.leading, 3)
                        
                        Spacer(minLength: 0)
                    }
                   
                    Text(user.fullname)
                        .font(.callout)
                        .foregroundStyle(.gray)
               
                    Text("フォロワー100万人")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .padding(.top, 14)
                }
                
                Button {
                    
                } label: {
                    Text("フォロー")
                        .font(.callout).bold()
                        .frame(width: 140, height: 36)
                        .foregroundColor(.primary)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.gray, lineWidth: 1)
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .padding([.top, .horizontal], 12)
            
            Divider()
                .padding(.leading, 65)
                .padding(.top, 4)
        }
    }
}

#Preview {
    UserCell(user: PreviewProvider.shared.user)
}
