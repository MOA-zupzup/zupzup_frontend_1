//
//  AnimatedCharacterView.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/13/25.
//

import SwiftUI

struct AnimatedCharacterView: View {
  @State private var circleScale: CGFloat = 1.0 // 원 크기 상태 변수
  
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.pink.opacity(0.4))
        .opacity(0.4)
        .frame(width: 90 * circleScale, height: 90 * circleScale)
      
      Circle()
        .fill(Color.pink.opacity(0.4))
        .opacity(0.4)
        .frame(width: 65 * circleScale, height: 65 * circleScale)
        .onAppear {
          // 뷰가 나타날 때 애니메이션 시작
          withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            circleScale = 1.2 // 원 크기 증가
          }
        }
      
      Button(action: {
        print("아이콘 버튼 클릭!")
      }) {
        Image("Rabbit2")
          .resizable()
          .frame(width: 54, height: 70)
          .padding()
          .foregroundColor(.gray)
      }
    }
  }
}


struct AnimatedCharacterView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedCharacterView()
  }
}

