//
//  ImageUploder.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploder {
    
    @MainActor
    static func uploadImage(_ image: UIImage) async throws -> String? {
        // profile画像は小さいサイズで保持
        let resizedImage = image.aspectFittedToHeight(100)
        guard let imageData = resizedImage.jpegData(compressionQuality: 0.25) else { return nil }
        
        // uniqeなfilenameに設定
        let filename = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            // imageDataをputData
            let _ = try await storageRef.putDataAsync(imageData)
            // 保存されたurlを取得
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Faild profile uploadImage: \(error.localizedDescription)")
            return nil
        }
    }
}
