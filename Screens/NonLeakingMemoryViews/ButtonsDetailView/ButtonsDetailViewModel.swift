//
//  ButtonsDetailViewModel.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import Foundation
import Combine
import SwiftUI

class ButtonsDetailsViewModel: ObservableObject {
    @Published var shouldNavigate: Bool = false
    var cancellables = Set<AnyCancellable>()
    
    // Here is the example of cofig as individual published properties
    @Published var strokeTitle: String = "Stroke button title"
    // shouldn't have it here.. this can come from some other design system component
    @Published var strokeTextColor: Color = .black
    @Published var strokeSize: CGFloat = 30
    @Published var storkeIsHugging: Bool = true
    @Published var strokeIcon: String? = "cloud.snow.fill"
    @Published var solidTitle = "Solid button title"

    let fruit: Fruit
    
    init(fruit: Fruit) {
        self.fruit = fruit
        $solidTitle
            .combineLatest($strokeTitle)
            .map { solidtitle, stroketitle in
                return solidtitle.isValid && stroketitle.isValid
            }
            .assign(to: &$shouldNavigate)
    }
    
    
    func resetScreen() {
        solidTitle = "Solid button title"
        strokeTitle = "Stroke button title"
        shouldNavigate = false
    }
}
