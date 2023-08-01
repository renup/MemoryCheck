//
//  ButtonsViewModel.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import Foundation
import Combine
import SwiftUI

class ButtonsViewModel: ObservableObject {
    @Published var shouldNavigate: Bool = true
    var cancellables = Set<AnyCancellable>()
    // Here is the example of cofig as individual published properties
    @Published var strokeTitle: String = "Stroke button title"
    // shouldn't have it here.. this can come from some other design system component
    @Published var strokeTextColor: Color = .purple
    @Published var strokeSize: CGFloat = 30
    @Published var storkeIsHugging: Bool = true
    @Published var strokeIcon: String? = "cloud.snow.fill"
    var fruits = Fruit.mock
    
    // here is the example of config in struct
    @Published var solidButtonTitle = "Solid Button title"

    init() {
        $solidButtonTitle
            .combineLatest($strokeTitle)
            .map { solidtitle, stroketitle in
                return solidtitle.isValid && stroketitle.isValid
            }
            .assign(to: &$shouldNavigate)
    }
    
    
    func resetScreen() {
        solidButtonTitle = "Solid button title"
        strokeTitle = "Stroke button title"
        shouldNavigate = false
    }
}
