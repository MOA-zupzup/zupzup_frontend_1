import SwiftUI

struct StoreView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 245/255, green: 246/255, blue: 247/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("상점")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .padding(.top,50)
                        .background(Color.white)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ShopCardView(
                                title: "행운의 편지",
                                subtitle: "네 잎 클로버와 함께 행운을 전해봐",
                                imageName: "CloverCard"
                            )
                            
                            ShopCardView(
                                title: "따뜻한 발자국",
                                subtitle: "따뜻한 마음을 담은 발자국으로 꾹꾹 담아 보내!",
                                imageName: "FootPrintCard"
                            )
                        }
                        .padding()
                        .padding(.top,20)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}
struct ShopCardView: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280)
                .cornerRadius(12)
                .padding(.horizontal,10)

            Text(title)
                .font(.headline)
                .padding(.top,10)
                .padding(.horizontal,10)
                
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal,10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
#Preview {
    StoreView()
}
