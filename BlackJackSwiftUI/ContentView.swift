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
            Image("table")
                .resizable()
                .ignoresSafeArea()
                
            
            VStack {
                CardStackView(cards: vm.dealerCards, isDealer: true, isGameFinished: vm.isGameFinished)
                    .frame(height: 300)
                
                HStack(alignment: .center) {
                    
                    CustomButton(title: "Stand", width: 150) {
                        withAnimation {
                            vm.stand()
                        }
                    }
                    
                    VStack {
                        Text(vm.dealerValue.description)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                        Text(vm.playerValue.description)
                            .font(.custom("Arial Rounded MT Bold", size: 35))
                    }
                    .frame(width: 50)
                    
                    CustomButton(title: "Hit", width: 150) {
                        withAnimation {
                            vm.hit()
                        }
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                
                CardStackView(cards: vm.playerCards, isDealer: false, isGameFinished: vm.isGameFinished)
                    .frame(height: 300)
                    
                
            }
            .padding()
            .alert(vm.isPlayerWon ? "Player Won" : "Dealer Won", isPresented: $vm.isAlertShowed) {
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
