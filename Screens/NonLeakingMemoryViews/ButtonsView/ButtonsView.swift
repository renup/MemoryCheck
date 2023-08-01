//
//  ButtonsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct ButtonsView: View {
    
    @StateObject var viewModel = ButtonsViewModel()
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
                    ButtonDetailsView(viewModel: ButtonsDetailsViewModel(fruit: fruit), path: $path)
                }
            })
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
