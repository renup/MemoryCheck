//
//  ButtonDetailsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct ButtonDetailsView: View {
    @StateObject var viewModel = ButtonsDetailsViewModel()
    
    var body: some View {
        NavigationView {
            
            NavigationLink(destination: ButtonDetailsView(viewModel: ButtonsDetailsViewModel()), isActive: $viewModel.shouldNavigate) {
                buttonsStack
            }
            .onDisappear {
                viewModel.cancellables.removeAll()
            }
            .onAppear {
                viewModel.resetScreen()
            }
            
        }
    }
    private var buttonsStack: some View {
        VStack(spacing: 10) {
            SolidButton1(title: $viewModel.solidTitle) {
                viewModel.solidTitle = "changed solid button title"
            }
            
            StrokeButton1(title: $viewModel.strokeTitle, icon: $viewModel.strokeIcon, textColor: $viewModel.strokeTextColor, size: $viewModel.strokeSize, isHugging: $viewModel.storkeIsHugging) {
                viewModel.strokeTitle = "changed stroke button title"
            }
        }
        .padding()
    }
}

struct ButtonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDetailsView(viewModel: ButtonsDetailsViewModel())
    }
}
