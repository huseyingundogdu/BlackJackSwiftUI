//
//  CustomButton.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 01/10/2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: (() -> Void)

    @State private var isPressed: Bool = false
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.custom("Arial Rounded MT Bold", size: 55))
                .foregroundStyle(isPressed ? .red : .gray)
        }
        .buttonStyle(.plain)
        .controlSize(.large)
        .onLongPressGesture { } onPressingChanged: { isPressing in
            isPressed = isPressing
        }
    }
}

#Preview {
    CustomButton(title: "Hit") {
        print("Button Pressed")
    }
}
