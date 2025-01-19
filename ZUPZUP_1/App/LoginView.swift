//
//  LoginView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            // 앱 제목
            Text("로그인")
                .padding(.horizontal,15)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top,70)
            
            // 사용자 이름 입력 필드
            TextField("아이디를 입력해주세요", text: $username)
                .frame(height:25)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1) )
                .padding(.horizontal, 15)
                .padding(.top,50)
            
            // 비밀번호 입력 필드
            SecureField("비밀번호를 입력해주세요", text: $password)
                .frame(height:25)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1) )

                .padding(.horizontal, 15)

            
            // 로그인 버튼
            Button(action: {
                print("로그인 버튼 눌림: \(username), \(password)")
            }) {
                Text("로그인")
                    .frame(height:25)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(username.isEmpty || password.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top,25)
            }
            .disabled(username.isEmpty || password.isEmpty)
            //아이디 및 비밀번호 찾기
            HStack(alignment: .center, spacing: 10) {
                Spacer()
                Text("아이디 찾기")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,10)
                Divider()
                    .frame(width:1, height: 20)
                    .background(Color.gray)
                Text("비밀번호 찾기")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal,10)
                Spacer()
            }
                .padding(.top,20)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginView()
}

