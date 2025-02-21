//
//  OneMailboxView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/6/25.
//

import SwiftUI

struct OneMailBoxView: View {
  let letter: Letter
  @State private var showActionSheet = false // ✅ 모달 표시 여부
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text(letter.title)
          .font(.body)
          .fontWeight(.light)
          .foregroundColor(.black)
        
        Text(formatDate(letter.createdAt))
          .font(.subheadline)
          .foregroundColor(Color.customCoral.opacity(0.8))
      }
      Spacer()
      
      Button(action: {
        showActionSheet.toggle() // ✅ 버튼 클릭 시 모달 표시
      }) {
        Image(systemName: "ellipsis")
          .foregroundColor(.gray)
      }
      .padding(.top, -15)
    }
    .padding()
    .background(Color.white)
    .cornerRadius(8)
    .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    .confirmationDialog("옵션 선택", isPresented: $showActionSheet, titleVisibility: .visible) { // ✅ 모달 추가
      Button("삭제하기", role: .destructive) {
        print("편지 삭제")
        // ⚠️ 삭제 기능 추가 가능
      }
      Button("취소하기", role: .cancel) { }
    }
  }
}

// 날짜 포맷 변환 함수
func formatDate(_ dateString: String) -> String {
  let inputFormatter = DateFormatter()
  inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
  inputFormatter.locale = Locale(identifier: "en_US_POSIX")  // ✅ 수정
  inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
  
  let outputFormatter = DateFormatter()
  outputFormatter.dateFormat = "yyyy.MM.dd"
  outputFormatter.locale = Locale(identifier: "ko_KR")
  
  if let date = inputFormatter.date(from: dateString) {
    return outputFormatter.string(from: date)
  } else {
    print("❌ 날짜 변환 실패: \(dateString)")  // ✅ 디버깅 추가
    return dateString
  }
}


struct OneMailBoxView_Previews: PreviewProvider {
  static var previews: some View {
    OneMailBoxView(letter: Letter(
      id: 1,
      senderId: 123,
      receiverId: 456,
      paperId: 5,
      title: "안녕하세요!",
      content: "이 편지를 받게 되었다면 행운이 따를 거예요.",
      location: "37.5665, 126.9780",
      createdAt: "2025-02-19T12:00:00Z",
      status: "unread",
      pictureUrl: "https://example.com/image.jpg",
      paperUrl: "https://example.com/paper.jpg",
      mailbox: "my-mailbox"
    ))
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
