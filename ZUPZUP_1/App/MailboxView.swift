import SwiftUI

struct MailboxView: View {
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("취소")
                        .foregroundStyle(Color.gray)
                    Spacer()
                    Text("봉투 꾸미기")
                        .fontWeight(.bold)
                        .foregroundStyle(Color("CustomDark"))
                    Spacer()
                    Button(action: {
                        // 완료 버튼 액션
                    }){
                        Text("완료")
                            .foregroundColor(Color("CustomGreen"))
                    }
                }
                .padding()
                .padding(.bottom, 10)
                
                ZStack {
                    Image("Example")
                        .resizable()
                        .frame(width: 320, height: 180)
                        .padding()
                    Text(inputText)
                }
            }
            .background(Color("CustomBeige"))
            
            Spacer()
                .frame(height:40)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("테마 선택")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    HStack {
                        VStack {
                            Image("Example")
                                .resizable()
                                .frame(width: 146, height: 82)
                                .padding()
                            Text("기본 테마")
                                .foregroundStyle(Color.gray)
                        }
                        Button(action: {}) {
                            Image(systemName: "plus.app")
                        }
                    }
                }.padding(.vertical)
                
                Text("편지 제목")
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                TextField("편지 제목을 입력해주세요", text: $inputText)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(Color.gray)
                            .opacity(0.5)
                        ,
                        alignment:.bottom
                        )
            }
            .padding()
            Spacer()
            Button(action:{
                
            }){
                Text("편지 보내기")
                    .frame(height:25)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(inputText.isEmpty ? Color.gray : Color("CustomGreen"))
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top,10)
            }
        }
    }
}

#Preview {
    MailboxView()
}
