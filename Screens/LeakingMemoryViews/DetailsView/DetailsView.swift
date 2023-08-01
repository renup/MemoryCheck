//
//  DetailsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel: DetailsViewModel
    @Binding var path: NavigationPath
   
    var body: some View {
        ZStack {
            viewModel.fruit.color
                .ignoresSafeArea()
            
            VStack {
                NavigationLink(value: viewModel.fruit) {
                    Text(viewModel.fruit.name)
                        .font(.largeTitle).bold()
                    buttonsStack
                }
            }
            .navigationDestination(for: Fruit.self) { fruit in
                if viewModel.shouldNavigate {
                    let selectedFruit = Fruit.mock.randomElement()
                    DetailsView(viewModel: DetailsViewModel(fruit: selectedFruit!), path: $path)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        path.removeLast(path.count)
                    } label: {
                        Image(systemName: "house")
                    }
                }
            }
            .onAppear {
                viewModel.resetScreen()
            }
            .onDisappear {
                viewModel.cancellables.removeAll()
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
    @State static var path = NavigationPath()
    
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(fruit: Fruit.mock.first!), path: $path)
    }
}
