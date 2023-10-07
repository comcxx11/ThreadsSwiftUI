//
//  DeveloperPreview.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI
import Firebase

class PreviewProvider {
    static let shared = PreviewProvider()
    
    private init() { }
    
    let user = User(id: UUID().uuidString, fullname: "Elon Musk", email: "elon.musk@gmail.com", username: "elon musk")
    let thread = Thread(ownerUid: "ownerUid", caption: "this is caption", timestamp: Timestamp(), likes: 3)
}
