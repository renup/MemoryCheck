//
//  ButtonsStack.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/31/23.
//

import SwiftUI

struct ButtonsStack: View {
    
    @StateObject var viewModel: ContentViewModel

    var body: some View {
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

struct ButtonsStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsStack(viewModel: ContentViewModel())
    }
}
