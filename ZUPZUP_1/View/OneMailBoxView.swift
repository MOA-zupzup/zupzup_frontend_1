//
//  OneMailboxView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/6/25.
//

import SwiftUI

struct OneMailboxView: View {
  var body: some View {
    HStack {
      Circle()
        .frame(width: 85, height: 85)
      Spacer()
        .frame(width: 25)
      VStack(alignment: .leading, spacing: 5) {
        Text("강승우")
          .font(.system(size: 24, weight: .bold))
        
        HStack {
          HStack {
            Text("주고 받은 편지")
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.customGreen)
            Image(systemName: "envelope")
              .foregroundColor(.customGreen)
              .padding(2)
          }
          .padding(5)
          .background(Color.customGreen.opacity(0.1))
          .cornerRadius(5)
          Text("3건")
            .foregroundColor(.gray)
        }
      }
      .padding(.trailing, 50)
      
      Button(action: {
        print("버튼 눌림")
      }) {
        Image(systemName: "ellipsis")
          .resizable()
          .scaledToFit()
          .frame(width: 18, height: 12)
          .foregroundColor(.customDark)
      }
      .padding(.bottom, 50)
      
    }
  }
}

struct OneMailboxView_Previews: PreviewProvider {
  static var previews: some View {
    OneMailboxView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

