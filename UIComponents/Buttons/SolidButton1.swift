//
//  SolidButton.swift
//  Fisker
//
//  Created by ManendraJawaria on 27/07/23.
//

import SwiftUI

struct SolidButton1: View {
    //    @State var viewModel: SolidButtonViewModel1
    
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


//struct SolidButtonViewModel1 {
//    var title: String
//    var icon: String?
//    var textColor: Color
//    var bgColor: Color
//    var size: CGFloat
//    var isHugging: Bool
//
//    init(
//        title: String,
//        icon: String? = nil,
//        textColor: Color,
//        bgColor: Color,
//        size: CGFloat = 20,
//        isHugging: Bool = true
//    ) {
//        self.title = title
//        self.icon = icon
//        self.textColor = textColor
//        self.bgColor = bgColor
//        self.size = size
//        self.isHugging = isHugging
//    }
//}

struct SolidButton1_Previews: PreviewProvider {
    @State static var title = "Solid button 1 title"
    static var previews: some View {
        SolidButton1(title: $title) {
            print("Solid button 1 taped")
        }
        
    }
}
