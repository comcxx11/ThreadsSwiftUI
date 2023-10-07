//
//  AuthButton.swift
//  ThreadsSwiftUI
//
//  Created by パクギョンソク on 2023/10/05.
//

import SwiftUI

struct AuthButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let buttonText: String
    let action: () -> Void
    var body: some View {
        
        Button {
            action()
        } label: {
            Text(buttonText)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 350, height: 44)
                .background(colorScheme == .dark ? .blue : .black)
                .cornerRadius(8)
        }
    }
}

#Preview {
    AuthButton(buttonText: "Login", action: {})
        .previewLayout(.sizeThatFits)
}
