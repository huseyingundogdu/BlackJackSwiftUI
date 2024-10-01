//
//  GameViewViewModel.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 30/09/2024.
//

import Foundation


class GameViewViewModel: ObservableObject {
    
    @Published var dealerCards: [Card] = []
    @Published var playerCards: [Card] = []
    
    @Published var dealerValue: String = ""
    @Published var playerValue: String = ""
    
    @Published var isGameFinished = false
    @Published var isPlayerWon = false
    
    @Published var deck: [Card] = []
    
    init() {
        //Create new deck
        self.deck = createNewDeck()
        
        //Start the game
        startTheGame()
        
        //Calculate the values
        self.dealerValue = calculateTheDealerValue()
        self.playerValue = calculateThePlayerValue()
    }
    
    //Create New Deck
    private func createNewDeck() -> [Card] {
        let suits = ["♥️", "♦️", "♠️", "♣️"]
        let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        var deck: [Card] = []
        
        for suit in suits {
            for (index, value) in values.enumerated() {
                let numericValue = min(index + 1, 10)
                deck.append(Card(value: value, numericValue: numericValue, suit: suit))
            }
        }
        return deck.shuffled()
    }
    
    //Draw Card from Deck
    private func drawCard() -> Card? {
        guard !deck.isEmpty else {
            return nil
        }
        return deck.removeLast()
    }
    
    private func drawCardForPlayer() {
        if let card = drawCard() {
            playerCards.append(card)
            playerValue = calculateThePlayerValue()
        }
    }
    
    private func drawCardForDealer() {
        if let card = drawCard() {
            dealerCards.append(card)
            dealerValue = calculateTheDealerValue()
        }
    }
    
    private func startTheGame() {
        drawCardForPlayer()
        drawCardForDealer()
        drawCardForPlayer()
        drawCardForDealer()
    }
    
    //Value Calculation
    private func calculateThePlayerValue() -> String {
        var value = 0
        for card in playerCards {
            value += card.numericValue
        }
        
        if value > 21 {
            isGameFinished = true
        }
        return value.description
    }
    
    private func calculateTheDealerValue() -> String {
        var value = 0
        
        for card in dealerCards {
            value += card.numericValue
        }
        
        if isGameFinished {
            return value.description
        } else {
            return (value - dealerCards[0].numericValue).description
        }
    }
    
    //Hit Button
    func hit() {
        drawCardForPlayer()
        playerValue = calculateThePlayerValue()
    }
    
    //Stand Button
    func stand() {
        isGameFinished.toggle()
        
        if Int(calculateTheDealerValue())! <= 16 {
            drawCardForDealer()
            
        }
    }
}
