//
//  WriteMessage.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/6/25.
//

import SwiftUI

struct WriteMessage: View {
  var body: some View {
    Button(action: {
        print("아이콘 버튼 클릭!")
    }) {
        Image(systemName: "square.and.pencil.circle.fill")
            .resizable()
            .frame(width: 80, height: 80)
            .padding()
            .foregroundColor(.black)
            .shadow(color: .black.opacity(0.1), radius: 10)
    }
  }
}

struct WriteMessage_Previews: PreviewProvider {
  static var previews: some View {
    WriteMessage()
      .previewLayout(.sizeThatFits)  // 크기 자동 조정
      .padding()
  }
}
