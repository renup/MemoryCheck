//
//  ButtonDetailsView.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct ButtonDetailsView: View {
    @StateObject var viewModel: ButtonsDetailsViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        
        ZStack {
            viewModel.fruit.color
                .ignoresSafeArea()
            NavigationLink(value: viewModel.fruit) {
                VStack {
                    Text(viewModel.fruit.name)
                        .font(.largeTitle).bold()
                        .padding()
                    buttonsStack
                }
            }            
        }
        .onDisappear {
            viewModel.cancellables.removeAll()
        }
        .onAppear {
            viewModel.resetScreen()
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
    @State static var path = NavigationPath()
    
    static var previews: some View {
        ButtonDetailsView(viewModel: ButtonsDetailsViewModel(fruit: Fruit.mock.first!), path: $path)
    }
}
