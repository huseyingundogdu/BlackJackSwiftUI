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
    
    @Published var dealerValue: Int = 0
    @Published var playerValue: Int = 0
    
    @Published var isAlertShowed = false
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
    
    func startTheGame() {
        drawCardForPlayer()
        drawCardForDealer()
        drawCardForPlayer()
        drawCardForDealer()
    }
    
    //Value Calculation
    private func calculateThePlayerValue() -> Int {
        var value = 0
        for card in playerCards {
            value += card.numericValue
        }
        
        if value > 21 {
            isAlertShowed = true
            isGameFinished = true
        }
        return value
    }
    
    private func calculateTheDealerValue() -> Int {
        var value = 0
        
        for card in dealerCards {
            value += card.numericValue
        }
        
        if isGameFinished {
            return value
        } else {
            return (value - dealerCards[0].numericValue)
        }
    }
    
    //Hit Button
    func hit() {
        //Draw card for player
        //Calculate the position
                            // True -> Show the result
        //Game is Finished
                            // False -> Game continue
        drawCardForPlayer()
        playerValue = calculateThePlayerValue()
    }
    
    //Stand Button
    func stand() {
        // Game is Finished = true
        // Calculate the dealers value
        // If < 16 -> Draw Card -> Stand
        // Else If -> If Dealer > Player -> Dealers wins else -> Player Wins
        // Else If -> Dealer > 21 -> Player Wins
        
        isGameFinished = true
        
        dealerValue = 0
        for dealerCard in dealerCards {
            dealerValue += dealerCard.numericValue
        }
        
        playerValue = calculateThePlayerValue()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            if self.dealerValue <= 16 {
                self.drawCardForDealer()
                self.stand()
            } else if self.dealerValue > 16 && self.dealerValue <= 21{
                if self.dealerValue > self.playerValue {
                    print("dealer wins")
                    self.isPlayerWon = false
                    self.isAlertShowed = true
                } else if self.dealerValue == self.playerValue {
                    print("draw")
                    self.isAlertShowed = true
                } else {
                    print("player wins")
                    self.isPlayerWon = true
                    self.isAlertShowed = true
                    
                }
            } else {
                print("player wins")
                self.isPlayerWon = true
                self.isAlertShowed = true
            }
        }
    }
    
    func resetTheGame() {
        dealerCards = []
        dealerValue = 0
        playerCards = []
        playerValue = 0
        isPlayerWon = false
        isGameFinished = false
        isAlertShowed = false
    }
}
