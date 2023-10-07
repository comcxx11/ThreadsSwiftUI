//
//  EditProfileViewModel.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    // 写真を選択
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    private var selectedImage: UIImage?
    @Published var profileImage: Image?
    
    @MainActor
    func updateUserData() async throws {
        // ProfileImageを変更した場合、StorageにImageを保持
       try await uploadProfileImage()
    }
    
    @MainActor
    private func uploadProfileImage() async throws {
        guard let image = selectedImage else { return }
        guard let imageUrl = try await ImageUploder.uploadImage(image) else { return }
        
        // userDataに profileImage downloadUrlを update
        try await UserService.shared.updateUserData(withProfileImageUrl: imageUrl)

    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.selectedImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
}
