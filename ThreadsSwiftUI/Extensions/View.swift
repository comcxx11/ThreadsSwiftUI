//
//  View.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/04.
//

import SwiftUI

extension View {
    var appIcon: some View {
        Image("threadsIcon")
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .padding()
    }
}
