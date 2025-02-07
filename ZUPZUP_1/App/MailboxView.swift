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
          HStack(){
              Text("취소")
              Spacer()
              Text("편지 작성하기")
                  .fontWeight(.bold)
              Spacer()
              Button("다음"){
                  
              }
          }
              
        }
  }
}

#Preview {
  MailboxView()
}
