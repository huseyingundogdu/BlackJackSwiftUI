//
//  Card.swift
//  BlackJackSwiftUI
//
//  Created by Huseyin on 29/09/2024.
//

import Foundation


struct Card: Identifiable, Equatable {
    let id = UUID()
    let value: String
    let numericValue: Int
    let suit: String
}

//♥️♦️♠️♣️
