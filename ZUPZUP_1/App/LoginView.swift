//
//  LoginView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment:.leading) {
            // 앱 로고

            HStack{
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 40)
                Spacer()
                
            }
                
            
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
                    .padding(.top,10)
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

            HStack{
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.gray.opacity(0.5))
                Text("or")
                    .foregroundColor(Color.gray.opacity(0.5))
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.gray.opacity(0.5))
                
            }
            .padding()
            AppleSigninButton()
                .padding(.top)
                .padding(.horizontal)
                .padding(.bottom)
            HStack{
                Spacer()
                Text("계정이 없으신가요? ")
                    .foregroundColor(Color.gray)
                    .padding(.leading)
                    .font(.system(size: 16))
                NavigationLink(destination: LoginView()){
                    Text("회원가입하기")
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.system(size: 15.5))
                        .fontWeight(.semibold)
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct AppleSigninButton: View{
    var body: some View{
        SignInWithAppleButton(.continue, onRequest: {request in request.requestedScopes=[.fullName,.email] }, onCompletion: {
            result in switch result{
            case .success(let authResults):
                (print("success"))
                switch authResults.credential{
                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                    let UserIdentifier = appleIDCredential.user
                    let fullName = appleIDCredential.fullName
                    let email = appleIDCredential.email
                    let IdentityToken=String(data: appleIDCredential.identityToken!, encoding: .utf8)
                    let AuthorizationCode=String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                    
                   
                default:
                    print("Unsupported credential type")
                    
                }
            case .failure(let error ): print(error)
            }
        })

        .frame(width : UIScreen.main.bounds.width * 0.85, height:50)
                .cornerRadius(5)
                
    }
}

#Preview {
    LoginView()
}

