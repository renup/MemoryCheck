//
//  IconButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct IconButton1: View {
    @State var viewModel: IconButtonViewModel1

    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                if let icon = viewModel.icon {
                    Image(systemName: icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: viewModel.size, height: viewModel.size)
                }
            }
            .frame(height: viewModel.size)
            .frame(maxWidth: .infinity)
        }
    }
}

struct IconButtonViewModel1 {
    let icon: String?
    let size: CGFloat
    
    init(
        icon: String? = nil,
        size: CGFloat = 20
    ) {
        self.icon = icon
        self.size = size
    }
}

struct IconButton1_Previews: PreviewProvider {
    static var previews: some View {
        IconButton1(viewModel: IconButtonViewModel1(icon: "sun.max", size: 30), action: {
            print("icon button 1 tapped")
        })
        
    }
}
