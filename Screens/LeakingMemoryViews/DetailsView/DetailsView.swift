//
//  DetailsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: DetailsView(viewModel: DetailsViewModel()), isActive: $viewModel.shouldNavigate) {
                    buttonsStack
                    }
                .onAppear {
                    viewModel.resetScreen()
                }
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

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel())
    }
}
