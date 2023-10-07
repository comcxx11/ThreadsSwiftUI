//
//  Thread.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/07.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var id: String? // Firebase側で自動生成してくれるid
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User? 
}
  
