//
//  ContentView.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GameViewViewModel()
    
    var body: some View {
        
        VStack {
            
            CardStackView(cards: vm.dealerCards, isDealer: true, isGameFinished: vm.isGameFinished)
            
            VStack {
                HStack {
                    Spacer()
                    Button("Hit") {
                        withAnimation {
                            vm.hit()
                        }
                    }
                    Spacer()
                    VStack {
                        Text("card remain: " + vm.deck.count.description)
                        Text("dealer: " + vm.dealerValue)
                        Text("player: " + vm.playerValue)
                    }
                    Spacer()
                    Button("Stand") {
                        vm.isGameFinished.toggle()
                    }
                    Spacer()
                }
            }
            
            CardStackView(cards: vm.playerCards, isDealer: false, isGameFinished: vm.isGameFinished)
            
        }
        .ignoresSafeArea()
        .alert(vm.isPlayerWon ? "Player Won" : "Dealer Won", isPresented: $vm.isGameFinished) {
            
            Button("OK"){
                //Reset The Game
            }
        } 
    }
}



#Preview {
    ContentView()
}
