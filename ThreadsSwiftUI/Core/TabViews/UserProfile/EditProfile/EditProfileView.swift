//
//  EditProfileView.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack (spacing: 12){
                    HStack {
                        VStack(alignment: .leading) {
                            Text("名前")
                                .fontWeight(.semibold)
                            
                            Text("JohnnyFPV")
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            // 初期表示は「selectedItem == nil」なのでCircluarが表示され
                            // イメージをタップすると PhotoPickerが起動する仕組み
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircluarProfileImageView(showFollowButton: false)
                            }
                        }
                    }
                    
                    Divider()
                        .padding(.trailing, 50)
                    
                    VStack(alignment: .leading ) {
                        Text("自己紹介")
                            .fontWeight(.semibold)
                        
                        TextField("自己紹介を入力してください。", text: $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("リンク")
                            .fontWeight(.semibold)
        
                        TextField("+リンクを追加", text: $link, axis: .vertical)

                    }
                    
                    Divider()
                    
                    Toggle("非公開プロフィール", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                .padding()
            }
            .navigationTitle("プロフィールを編集")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完了") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemBlue))
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
