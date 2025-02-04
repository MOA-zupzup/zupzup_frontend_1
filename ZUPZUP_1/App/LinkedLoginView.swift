//
//  LinkedLoginView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI
import AuthenticationServices

struct LinkedLoginView: View {
    var body: some View {
        NavigationStack{
            VStack{
                AppleSigninButton()
                    .padding(.top)
                    .padding(.bottom)
              
                HStack{
                    Text("계정이 없으신가요? ")
                        .foregroundColor(Color.gray)
                        .padding(.leading)
                        .font(.system(size: 16))
                    NavigationLink(destination: LoginView()){
                        Text("회원가입하기")
                            .foregroundColor(Color.black)
                            .font(.system(size: 15.5))
                            .fontWeight(.semibold)
                    }
                }
                
                
            }
        }
        
    }
}
struct AppleSigninButton: View{
    var body: some View{
        SignInWithAppleButton(onRequest: {request in request.requestedScopes=[.fullName,.email] }, onCompletion: {
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

        .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
                .cornerRadius(5)
                
    }
}
#Preview {
    LinkedLoginView()
}
