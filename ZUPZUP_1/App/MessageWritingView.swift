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
        f.dateFormat = "yyyy년 MM월 dd일"
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
                Button("다음"){
                    saveMemo(text: memoText)
                }
                
            }
            .padding()
            Spacer()
            Text("\(formatter.string(from: now))")
            TextEditor(text:$memoText)
                .padding(.horizontal)
        }
    }
}

#Preview {
    MessageWritingView()
}
