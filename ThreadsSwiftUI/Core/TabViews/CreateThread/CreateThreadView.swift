//
//  CreateThreadView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

struct CreateThreadView: View {
        
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: CreateThreadViewModel = CreateThreadViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                HStack(alignment: .top) {
                    CircluarProfileImageView(user: viewModel.currentUser)
                    
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text(viewModel.currentUser?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("スレッドを開始...", text: $viewModel.caption, axis: .vertical)
                    })
                    
                    Spacer()
                    
                    // X button
                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
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
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.caption.isEmpty)
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
