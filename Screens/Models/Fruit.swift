//
//  Fruit.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import Foundation
import SwiftUI

struct Fruit: Hashable {
    let name: String
    let color: Color
    
    static let mock = [
        Fruit(name: "Mango", color: .yellow),
        Fruit(name: "Apple", color: .red),
        Fruit(name: "Orange", color: .orange),
        Fruit(name: "Grapes", color: .purple),
        Fruit(name: "Water Melon", color: .green)
    ]
}
