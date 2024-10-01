//
//  CustomButton.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 01/10/2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var width: CGFloat?
    var height: CGFloat?
    var action: (() -> Void)
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.custom("Arial Rounded MT Bold", size: 35))
                .foregroundStyle(.white)
        }
        .frame(width: width, height: height)
        .buttonStyle(.bordered)
        .background(isPressed ? .red : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 12))
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
    .frame(width: 150)
}
