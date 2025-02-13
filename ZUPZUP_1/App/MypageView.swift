//
//  MypageView.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 1/19/25.
//

import SwiftUI

struct MypageView: View {
  var body: some View {
    ScrollView {
      VStack {
        HStack {
          Text("프로필 설정")
            .font(.title)
            .bold()
            .padding(.top, 20)
          Spacer()
        }
        .padding(.horizontal, 20)
        
        // 캐릭터 카드
        ZStack {
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(width: 270, height: 360)
            .shadow(color: Color.pink.opacity(0.3), radius: 10, x: 0, y: 5)
          
          VStack(spacing: 20) {
            Text("사용자 닉네임")
              .font(.headline)
            
            Image("Rabbit2") // 실제 캐릭터 이미지 추가
              .resizable()
              .scaledToFit()
              .frame(width: 160, height: 160)
            
            Text("캐릭터 대사")
              .font(.subheadline)
              .foregroundColor(.gray)
            
            Text("레벨")
              .font(.caption)
              .foregroundColor(.gray)
          }
        }
        .padding(.top, 30)
        
        Spacer().frame(height: 30)
        
        // ✅ `List` 대신 `VStack` + `ForEach` 사용 ✅
        VStack {
          SectionView(title: "계정", items: [
            ("아이디", "@wfrwfwwggf"),
            ("연동", "네이버 로그인"),
            ("비밀번호 변경", ""),
            ("로그아웃", "")
          ])
          
          SectionView(title: "권한", items: [
            ("푸시 알림", "허용"),
            ("위치", "")
          ])
          
          SectionView(title: "앱 정보", items: [
            ("앱 버전", ""),
            ("약관 및 정책", ""),
            ("1:1 문의하기", "")
          ])
        }
        .padding(.horizontal, 20)
      }
    }
  }
}

struct SectionView: View {
  let title: String
  let items: [(String, String)]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.headline)
        .padding(.vertical, 5)
      
      ForEach(items, id: \.0) { item in
        HStack {
          Text(item.0)
          Spacer()
          if !item.1.isEmpty {
            Text(item.1)
              .foregroundColor(.gray)
          }
        }
        .padding(.vertical, 8)
      }
      
      Divider()
    }
  }
}

struct MypageView_Previews: PreviewProvider {
  static var previews: some View {
    MypageView()
  }
}
