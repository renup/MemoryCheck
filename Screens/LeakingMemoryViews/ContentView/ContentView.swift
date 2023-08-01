//
//  ContentView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @State var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                List(viewModel.fruits, id: \.self) { fruit in
                    NavigationLink(value: fruit) {
                        Text(fruit.name)
                            .font(.body).bold()
                            .foregroundColor(fruit.color)
                    }
                }
                buttonsStack
            }
            .navigationDestination(for: Fruit.self, destination: { fruit in
                if viewModel.shouldNavigate {
                    DetailsView(viewModel: DetailsViewModel(fruit: fruit), path: $path)
                }
            })
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
