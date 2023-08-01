//
//  ButtonsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct ButtonsView: View {
    
    @StateObject var viewModel = ButtonsViewModel()
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ButtonDetailsView(), isActive: $viewModel.shouldNavigate) {
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
            SolidButton1(title: $viewModel.solidButtonTitle) {
                viewModel.solidButtonTitle = "changed solid button title"
            }
            
            StrokeButton1(title: $viewModel.strokeTitle, icon: $viewModel.strokeIcon, textColor: $viewModel.strokeTextColor, size: $viewModel.strokeSize, isHugging: $viewModel.storkeIsHugging) {
                viewModel.strokeTitle = "changed stroke button title"
            }
        }
        .padding()
    }
        
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
