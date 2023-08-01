//
//  SolidButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct SolidButton1: View {
    @Binding var title: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "snowflake.circle")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 30)
            }
            
            Text(title)
                .font(.body)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct SolidButton1_Previews: PreviewProvider {
    @State static var title = "Solid button 1 title"
    static var previews: some View {
        SolidButton1(title: $title) {
            print("Solid button 1 taped")
        }
        
    }
}
