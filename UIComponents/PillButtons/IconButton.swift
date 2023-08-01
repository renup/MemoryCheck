//
//  IconButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct IconButton: View {
        
    @StateObject var viewModel: IconButtonViewModel
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center) {
                if let icon = viewModel.icon {
                    Image(systemName: icon)
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: viewModel.size, height: viewModel.size)
                }
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
        }
    }
}

class IconButtonViewModel: ObservableObject {
    @Published var icon: String?
    @Published var size: CGFloat
    
    init(
        icon: String? = "sun.max",
        size: CGFloat = 50
    ) {
        self.icon = icon
        self.size = size
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(viewModel: IconButtonViewModel(icon: "sun.min", size: 30), action: {
            print("icon button 1 tapped")
        })
        
    }
}
