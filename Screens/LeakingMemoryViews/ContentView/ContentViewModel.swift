//
//  ContentViewModel.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/30/23.
//

import Foundation
import Combine

extension String {
    var isValid: Bool {
        return self.hasPrefix("changed")
    }
}

enum PillButton: CaseIterable {
    case solidButton, strokeButton
}

enum RegularButton: CaseIterable {
    case solidButton1, strokeButton1
}

protocol ViewModelProtocol {}

class ContentViewModel: ObservableObject {
    
    @Published var shouldNavigate: Bool = false
    var cancellables: Set<AnyCancellable> = []
    @Published var fruits = Fruit.mock

    init() {
        areAllButtonsValidPublisher
            .assign(to: \.shouldNavigate, on: self)
            .store(in: &cancellables)
    }
    
    
    let solidButtonVM = SolidButtonViewModel(title: "Solid button title", textColor: .white, bgColor: .green)
    
    
    let strokeButtonVM = StrokeButtonViewModel(title: "Stroke button title", textColor: .purple)
    
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
        solidButtonVM.title = "Solid button title"
        strokeButtonVM.title = "Stroke button title"
        shouldNavigate = false
    }
    
}
