//
//  DeveloperPreview.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/06.
//

import SwiftUI

class PreviewProvider {
    static let shared = PreviewProvider()
    
    private init() { }
    
    let user = User(id: UUID().uuidString, fullname: "Elon Musk", email: "elon.musk@gmail.com", username: "elon musk")
}
