//
//  CreateThreadView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                HStack(alignment: .top) {
                    CircluarProfileImageView(showFollowButton: false)
                    
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text("Elon Musk")
                            .fontWeight(.semibold)
                        
                        TextField("スレッドを開始...", text: $caption, axis: .vertical)
                    })
                    
                    Spacer()
                    
                    // X button
                    if !caption.isEmpty {
                        Button {
                           caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .font(.footnote)
                
                
                Spacer()

            }
            .padding()
            .navigationTitle("新規スレッド")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("キャンセル") {
                        // TODO: captionがあれば アラートを出すように
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("投稿する") {
                        
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
