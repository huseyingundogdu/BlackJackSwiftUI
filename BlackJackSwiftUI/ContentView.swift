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
        ZStack {
            VStack {
                CardStackView(cards: vm.dealerCards, isDealer: true, isGameFinished: vm.isGameFinished)
                
                HStack(alignment: .center) {
                    
                    CustomButton(title: "Stand", width: 150) {
                        
                    }
                    
                    VStack {
                        Text(vm.dealerValue)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                        Text(vm.playerValue)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                    }
                    .frame(width: 50)
                    
                    CustomButton(title: "Hit", width: 150) {
                        print("Hit Pressed")
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
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
}



#Preview {
    ContentView()
}
