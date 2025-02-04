//
//  SignUpBtn.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 2/4/25.
//

import SwiftUI

struct SignUpBtn: View {
    var isDisabled: Bool // 버튼 활성화 여부를 결정하는 변수
    
    var body: some View {
        Button(action: {
            print("회원가입 버튼 클릭")
        }) {
            Text("회원가입")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isDisabled ? Color(white: 0.7) : Color.customGreen) // 비활성화 상태일 때 회색 배경
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(isDisabled) // 버튼 비활성화 설정
    }
}

#Preview {
    SignUpBtn(isDisabled: true) // 테스트할 때는 true/false로 변경해볼 수 있음
}
