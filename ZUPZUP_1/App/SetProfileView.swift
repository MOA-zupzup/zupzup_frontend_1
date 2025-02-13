//
//  SetProfileView.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/4/25.
//

import SwiftUI

import SwiftUI

struct SetProfileView: View {
    @State private var selectedCharacter: Int? = nil
    @State private var nickname: String = ""

    let characters = ["character1", "character2", "character3"] // 캐릭터 이미지 이름
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text("프로필 설정")
                .font(.title)
                .bold()
                .padding(.top, 20)

            VStack(alignment: .leading, spacing: 10) {
                Text("캐릭터")
                    .font(.headline)
                
                Text("나의 캐릭터를 선택해주세요")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
              HStack (spacing: 35) {
                    ForEach(0..<characters.count, id: \.self) { index in
                        Image(characters[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .onTapGesture {
                                selectedCharacter = index
                            }
                            .opacity(selectedCharacter == index ? 1.0 : 0.5) // 선택되지 않은 캐릭터 흐리게
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .top)
                .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("별명")
                    .font(.headline)
                
                TextField("사용할 별명을 입력해 주세요", text: $nickname)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.bottom, 10)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
            }
            
            Spacer()
          
          SignUpBtn(isDisabled: nickname.isEmpty || selectedCharacter == nil)

        }
        .padding()
    }
}


struct SetProfileView_Previews: PreviewProvider {
  static var previews: some View {
    SetProfileView()
  }
}

