//
//  StrokeButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct StrokeButton1: View {
    @Binding var title: String
    @Binding var icon: String?
    @Binding var textColor: Color
    @Binding var size: CGFloat
    @Binding var isHugging: Bool
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 5) {
                if let icon = icon {
                    Image(systemName: icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 25, height: 25)
                }
                
                Text(title)
                    .font(.body)
            }
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .frame(height: 100)
            .frame(maxWidth: isHugging ? nil : .infinity)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(textColor, lineWidth: 2))
        }
    }
}

struct StrokeButton1_Previews: PreviewProvider {
    
    @State static var title = "Stroke button title"
    @State static var icon: String? = "heart"
    @State static var textColor = Color.red
    @State static var size: CGFloat = 20.0
    @State static var isHugging = true
        
    static var previews: some View {
        StrokeButton1(title: $title, icon: $icon, textColor: $textColor, size: $size, isHugging: $isHugging) {
            print("Stroke button 1 tapped")
        }
        
    }
}

