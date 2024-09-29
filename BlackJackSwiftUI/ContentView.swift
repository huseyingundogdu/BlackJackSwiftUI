//
//  ContentView.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 16/09/2024.
//

import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let value: String
    let numericValue: Int
    let suit: String
}

//♥️♦️♠️♣️

struct ContentView: View {
    @State private var playerCards: [Card] = [
        Card(value: "3", numericValue: 3, suit: "♥️"),
        Card(value: "3", numericValue: 3, suit: "♣️"),
    ]
    @State private var dealerCards: [Card] = []
    @State private var deck: [Card] = []
    //@State private var gameStatus = "Player's turn"
    
    var body: some View {
        
        VStack {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    ZStack {
                        let cardWidth = geo.size.width / 2
                        let cardHeight = geo.size.height / 2
                        let leftSideSpacingFactor = (geo.size.width / 2) / CGFloat(playerCards.count - 1)
                        
                        ForEach(Array(playerCards.enumerated()), id: \.element.id) { index, card in
                            if card == playerCards.last {
                                CardView(card: card)
                                    .frame(
                                        width: cardWidth,
                                        height: cardHeight
                                    )
                                    .offset(x: geo.size.width / 2)
                            } else {
                                CardView(card: card)
                                    .frame(
                                        width: cardWidth,
                                        height: cardHeight
                                    )
                                    .offset(x: CGFloat(index) * leftSideSpacingFactor)
                            }
                        }
                    }
                    
                    ZStack {
                        let cardWidth = geo.size.width / 2
                        let cardHeight = geo.size.height / 2
                        let leftSideSpacingFactor = (geo.size.width / 2) / CGFloat(playerCards.count - 1)
                        
                        ForEach(Array(playerCards.enumerated()), id: \.element.id) { index, card in
                            if card == playerCards.last {
                                CardView(card: card)
                                    .frame(
                                        width: cardWidth,
                                        height: cardHeight
                                    )
                                    .offset(x: geo.size.width / 2)
                            } else {
                                CardView(card: card)
                                    .frame(
                                        width: cardWidth,
                                        height: cardHeight
                                    )
                                    .offset(x: CGFloat(index) * leftSideSpacingFactor)
                            }
                        }
                    }
                }
            }
            
            Button("Add new card") {
                withAnimation {
                    playerCards.append(Card(value: "3", numericValue: 3, suit: "♦️"))
                }
            }
        }
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 2)
            
            VStack {
                HStack(alignment: .bottom) {
                    VStack {
                        Text(card.value)
                        Text(card.suit)
                    }
                    Spacer()
                }
                Spacer()
                Text(card.value)
                    .font(.largeTitle)
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        //.frame(width: 100, height: 150)
    }
}

#Preview {
    ContentView()
}
