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
                        vm.stand()
                    }
                    
                    VStack {
                        Text(vm.dealerValue.description)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                        Text(vm.playerValue.description)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                    }
                    .frame(width: 50)
                    
                    CustomButton(title: "Hit", width: 150) {
                        vm.hit()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                
                CardStackView(cards: vm.playerCards, isDealer: false, isGameFinished: vm.isGameFinished)
            }
            .ignoresSafeArea()
            .alert(vm.isPlayerWon ? "Player Won" : "Dealer Won", isPresented: $vm.isGameFinished) {
                Button("Ok", role: .cancel) {
                    vm.resetTheGame()
                    vm.startTheGame()
                }
                
            } message: {
                Text("Dealer: \(vm.dealerValue) \n Player: \(vm.playerValue)")
            }
            

        }
    }
}



#Preview {
    ContentView()
}
