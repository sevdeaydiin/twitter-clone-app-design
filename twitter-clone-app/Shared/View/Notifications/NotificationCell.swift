//
//  NotificationCell.swift
//  twitter-clone-app
//
//  Created by Sevde Aydın on 19.07.2024.
//

import SwiftUI

struct NotificationCell: View {
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: Sizes.width, height: 1, alignment: .center)
                .foregroundStyle(.gray)
                .opacity(Stable.opacitiy)
            
            HStack (alignment: .top) {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                VStack (alignment: .leading, spacing: 5){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .cornerRadius(18)
                    
                    Text("Sevde ")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    +
                    Text("followed you")
                        .foregroundStyle(.black)
                }
                Spacer()
            }.padding(.leading, 30)
            
        }
    }
}

#Preview {
    NotificationCell()
}
