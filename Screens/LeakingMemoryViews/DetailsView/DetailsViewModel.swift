//
//  DetailsViewModel.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    
    @Published var shouldNavigate: Bool = false
    var cancellables = Set<AnyCancellable>()
    let fruit: Fruit
    
    init(fruit: Fruit) {
        self.fruit = fruit
        areAllButtonsValidPublisher
            .assign(to: \.shouldNavigate, on: self)
            .store(in: &cancellables)
    }
    
    
    let solidButtonVM = SolidButtonViewModel(title: "Solid button title in DetailsView", textColor: .white, bgColor: .blue)
    
    
    let strokeButtonVM = StrokeButtonViewModel(title: "Stroke button title in DetailsView", textColor: .black)
    
    private var solidButtonValidPublisher: AnyPublisher<Bool, Never> {
        solidButtonVM.$title
            .debounce(for: 0.1, scheduler: DispatchQueue.main)
            .map { $0.isValid }
            .eraseToAnyPublisher()
    }
    
    private var strokeButtonValidPublisher: AnyPublisher<Bool, Never> {
        strokeButtonVM.$title
            .debounce(for: 0.1, scheduler: DispatchQueue.main)
            .map { $0.isValid }
            .eraseToAnyPublisher()
    }
    
    private var areAllButtonsValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(solidButtonValidPublisher, strokeButtonValidPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    func resetScreen() {
        solidButtonVM.title = "Solid button title in DetailsView"
        strokeButtonVM.title = "Stroke button title in DetailsView"
        shouldNavigate = false
    }
    
}

