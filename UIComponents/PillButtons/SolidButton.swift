//
//  SolidButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct SolidButton: View {
    
    @StateObject var viewModel: SolidButtonViewModel
    
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
            .background(viewModel.bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

class SolidButtonViewModel: ObservableObject {
    @Published var title: String
    @Published var icon: String?
    @Published var textColor: Color
    @Published var bgColor: Color
    @Published var size: CGFloat
    @Published var isHugging: Bool
    
    init(
        title: String,
        icon: String? = nil,
        textColor: Color,
        bgColor: Color,
        size: CGFloat = 20,
        isHugging: Bool = true
    ) {
        self.title = title
        self.icon = icon
        self.textColor = textColor
        self.bgColor = bgColor
        self.size = size
        self.isHugging = isHugging
    }
}

struct SolidButton_Previews: PreviewProvider {
    static var previews: some View {
        SolidButton(viewModel: SolidButtonViewModel(title: "Solid button title", textColor: .white, bgColor: .blue)) {
            print("Solid button taped")
        }
        
    }
}
