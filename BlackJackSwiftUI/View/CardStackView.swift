//
//  DeckView.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 30/09/2024.
//

import SwiftUI

struct CardStackView: View {
    var cards: [Card]
    var isDealer: Bool
    var isGameFinished: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                let cardWidth = geo.size.width / 2
                let cardHeight = geo.size.height
                let spacing = (geo.size.width / 2) / CGFloat(cards.count - 1)
                
                ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                    if card == cards.last {
                        CardView(card: card)
                            .frame(
                                width: cardWidth,
                                height: cardHeight
                            )
                            .offset(x: geo.size.width / 2)
                    } else {
                        if index == 0 && isDealer && !isGameFinished {
                            Image("back")
                                .resizable()
                                .frame(width: cardWidth, height: cardHeight)
                                .scaledToFill()
                        } else {
                            CardView(card: card)
                                .frame(
                                    width: cardWidth,
                                    height: cardHeight
                                )
                                .offset(x: CGFloat(index) * spacing)
                        }
                    }
                }
                .transition(.push(from: .trailing))
            }
        }
    }
}

#Preview {
    CardStackView(cards: sampleCards, isDealer: false, isGameFinished: false)
}

let sampleCards =
[
    Card(value: "3", numericValue: 3, suit: "♦️"),
    Card(value: "A", numericValue: 10, suit: "♠️"),
    Card(value: "A", numericValue: 10, suit: "♠️"),
    Card(value: "A", numericValue: 10, suit: "♠️")
]
