//
//  MessageOnMap.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/6/25.
//

import SwiftUI

struct MessageOnMap: View {
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.white)
        .opacity(0.1)
        .frame(width: 150, height: 150)
      
      Circle()
        .fill(Color.customGreen)
        .opacity(0.4)
        .frame(width: 120, height: 120)
      
      Circle()
        .fill(Color.customGreen)
        .opacity(0.4)
        .frame(width: 90, height: 90)
      

      Button(action: {
          print("아이콘 버튼 클릭!")
      }) {
          Image(systemName: "envelope")
              .resizable()
              .frame(width: 48, height: 36)
              .padding()
              .foregroundColor(.gray)
      }
      ZStack {
        Circle()
          .fill(Color.customCoral)
          .frame(width: 20, height: 20) // 원 크기 설정
        
        Text ("3")
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(.white)
      }
      .offset(x: 24, y: -18)
    }
  }
}

struct MessageOnMap_Previews: PreviewProvider {
  static var previews: some View {
    MessageOnMap()
      .previewLayout(.fixed(width: 150, height: 150))
  }
}

