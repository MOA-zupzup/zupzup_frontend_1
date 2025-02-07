//
//  MessageWritingView.swift
//  ZUPZUP_1
//
//  Created by 강승우 on 1/20/25.
//

import SwiftUI

struct MessageWritingView: View {
    @State private var memoText: String = ""
    let now = Date()
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy.MM.dd"
        f.locale = Locale(identifier: "ko_KR")
        return f
    }()
    func saveMemo(text:String){
        UserDefaults.standard.set(text, forKey: "savedMemo")
    }
    var body: some View {
        VStack{
            HStack(){
                Text("취소")
                Spacer()
                Text("편지 작성하기")
                    .fontWeight(.bold)
                Spacer()
                Button(action:{
                    saveMemo(text: memoText)
                }){
                    Text("다음")
                        .foregroundColor(Color("CustomGreen"))
                }
                
            }
            .padding()
        
            Spacer()
            HStack{
                Text("\(formatter.string(from: now))")
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .foregroundStyle(Color.gray)
                Spacer()
            }
            .padding(.top,30)
            .padding(.horizontal,20)
            
            TextEditor(text:$memoText)
                .tint(Color("CustomGreen"))
                .padding(.horizontal)
        }
    }
}

#Preview {
    MessageWritingView()
}
