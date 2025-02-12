import SwiftUI

struct SignUpView: View {
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(alignment:.leading) {
            Spacer()
            Text("회원가입")
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .padding()
            Text("이름")
                .padding(.vertical, 5)
                .padding(.horizontal)
                .font(.system(size: 17, weight: .regular, design: .rounded))
            TextField("이름을 입력해주세요", text: $inputText)
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
                .padding(.horizontal)
            Spacer()
            Text("이메일")
                .font(.system(size: 17, weight: .regular, design: .rounded))
                .padding(.vertical, 5)
                .padding(.horizontal)
            TextField("이메일을 입력해주세요", text: $inputText)
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
                .padding(.horizontal)
            Spacer()
            Text("비밀번호")
                .font(.system(size: 17, weight: .regular, design: .rounded))
                .padding(.vertical, 5)
                .padding(.horizontal)
            SecureField("비밀번호을 입력해주세요", text: $inputText)
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
                .padding(.horizontal)
            SecureField("확인을 위해 다시 입력해주세요", text: $inputText)
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
                .padding(.horizontal)
            Spacer()
            Button(action:{
                
            }){
                Text("회원가입")
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
    SignUpView()
}
