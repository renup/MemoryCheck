//
//  StrokeButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct StrokeButton: View {
    @StateObject var viewModel: StrokeButtonViewModel
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 5) {
                if let icon = viewModel.icon {
                    Image(systemName: icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: viewModel.size, height: viewModel.size)
                }
                
                Text(viewModel.title)
                    .font(.body)
            }
            .foregroundColor(viewModel.textColor)
            .padding(.horizontal, 20)
            .frame(height: 60)
            .frame(maxWidth: viewModel.isHugging ? nil : .infinity)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(viewModel.textColor, lineWidth: 2))
        }
    }
}

class StrokeButtonViewModel: ObservableObject {
    @Published var title: String
    @Published var icon: String?
    @Published var textColor: Color
    @Published var size: CGFloat
    @Published var isHugging: Bool
    
    init(
        title: String,
        icon: String? = "sun.min",
        textColor: Color,
        size: CGFloat = 20,
        isHugging: Bool = true
    ) {
        self.title = title
        self.icon = icon
        self.textColor = textColor
        self.size = size
        self.isHugging = isHugging
    }
}

struct StrokeButton_Previews: PreviewProvider {
    
    static var previews: some View {
        StrokeButton(viewModel: StrokeButtonViewModel(title: "stroke button title", textColor: .purple)) {
            print("Stroke button tapped")
        }
        
    }
}

