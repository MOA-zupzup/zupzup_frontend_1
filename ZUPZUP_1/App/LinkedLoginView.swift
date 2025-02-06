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

#Preview {
    LinkedLoginView()
}
