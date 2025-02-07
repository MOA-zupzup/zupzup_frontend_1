//
//  MailboxView.swift
//  ZUPZUP
//
//  Created by 강승우 on 1/3/25.
//

import SwiftUI

struct MailboxView: View {
  var body: some View {
      VStack{
          VStack{
              
              HStack(){
                  Text("취소")
                      .foregroundStyle(Color.gray)
                  Spacer()
                  Text("봉투 꾸미기")
                      .fontWeight(.bold)
                      .foregroundStyle(Color("CustomDark"))
                  Spacer()
                  Button(action:{
                      
                  }){
                      Text("완료")
                          .foregroundColor(Color("CustomGreen"))
                  }
              }
              .padding()
              .padding(.bottom,10)
              Image("Example")
                  .resizable()
                  .frame(width: 320, height: 180)
                  .padding()
              
              
              
              
          }
          .background(Color("CustomBeige"))
          Spacer()
          VStack{
              Text("테마 선택")
                  .font(.system(size: 20, weight: .regular, design: .rounded))
              HStack{
                  VStack{
                      Image("Example")
                          .resizable()
                          .frame(width:146, height:82)
                          .padding()
                      Text("기본 테마")
                          .foregroundStyle(Color.gray)
                  }
                  Button(action:{}){
                      Image(systemName:"plus.app")
                  }
                  
              }
          }
      }
  }
}

#Preview {
  MailboxView()
}
