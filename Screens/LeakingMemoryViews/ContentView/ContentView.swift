//
//  ContentView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        
        NavigationView {
            
            NavigationLink(destination: DetailsView(viewModel: DetailsViewModel()), isActive: $viewModel.shouldNavigate) {
                buttonsStack
//                   ButtonsStack(viewModel: viewModel)
                }
            .onAppear {
                viewModel.resetScreen()
            }
            
        }
    }
    
    private var buttonsStack: some View {
        VStack(spacing: 10) {
            SolidButton(viewModel: viewModel.solidButtonVM) {
                viewModel.solidButtonVM.title = "changed solid button title"
            }
            
            StrokeButton(viewModel: viewModel.strokeButtonVM) {
                viewModel.strokeButtonVM.title = "changed stroke button title"
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
