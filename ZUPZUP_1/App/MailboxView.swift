//
//  MailboxView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//
import SwiftUI

struct MailboxView: View {
  @State private var letters: [Letter] = [] // JSON 데이터를 저장할 배열
  
  var body: some View {
    NavigationView {
      ZStack(alignment: .top) {
        Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all) // ✅ 전체 배경 설정
        
        VStack(spacing: 0) {
          // ✅ 상단 네비게이션 영역 (흰색 배경)
          VStack {
            Text("편지함")
              .font(.title2)
              .fontWeight(.bold)
          }
          .frame(maxWidth: .infinity)
          .frame(height: 60) // ✅ 네비게이션 바 영역 고정
          .background(Color.white)
          .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2) // ✅ 그림자 추가
          
          // ✅ 스크롤 가능한 편지 목록
          ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
              Text("내가 받은 편지")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top, 10)
              
              ForEach(letters) { letter in
                OneMailBoxView(letter: letter) // ✅ 편지 뷰 반복
              }
            }
            .padding()
          }
          .background(Color(UIColor.systemGroupedBackground)) // ✅ 리스트 영역 회색 배경
        }
      }
      .navigationBarHidden(true) // ✅ 기본 네비게이션 바 숨김
      .onAppear {
        DispatchQueue.main.async {
          letters = loadLetters()
          print("✅ 로드된 편지 개수: \(letters.count)")
        }
      }
    }
  }
}

// 📌 미리보기
struct MailboxView_Previews: PreviewProvider {
  static var previews: some View {
    MailboxView()
  }
}
