//
//  CardView.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 29/09/2024.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.clear)
                        .stroke(.black)
                        .padding(7)
                }
            
            VStack {
                HStack {
                    VStack {
                        Text(card.value)
                        Text(card.suit)
                            .foregroundStyle(.black)
                    }
                    .font(.largeTitle)
                    Spacer()
                }
                
                Spacer()
                
                HStack {                    
                    VStack {
                        Text(card.value)
                        Text(card.suit)
                            .foregroundStyle(.black)
                    }
                    .font(.largeTitle)
                    Spacer()
                }
            }
            .padding()
            
            Text(card.value)
                .font(.system(size: 60))
                .bold()
        }
    }
}

#Preview {
    CardView(card: sampleCard)
}

let sampleCard = Card(value: "3", numericValue: 3, suit: "♦️")
