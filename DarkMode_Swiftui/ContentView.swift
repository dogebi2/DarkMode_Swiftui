//
//  ContentView.swift
//  DarkMode_Swiftui
//
//  Created by rainxlh on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    
    var body: some View {
        
        ZStack{
            // Color.yellow
            Theme.myBackgroundColor(forSchem: scheme)
            
            VStack{
                Spacer()
                
                Button(action: {
                    print("버튼이 클릭되였으")
                    shouldShowAlert.toggle()
                    
                }, label: {
                    Text("로그인 하러 가기쓰")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forSchem: scheme))
                        .cornerRadius(13 )
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.white,lineWidth: 3)
                        )
                    
                        
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("안녕하세요"),message: Text("오늘도 코딩쓰"),dismissButton: .default(Text("닫기")))
                })
                
                
                Spacer().frame(height:100)
            }
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forSchem scheme: ColorScheme) ->
    Color{
        
        let lightColor = Color.white
        let darkColor = Color.init(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
      
        }
    }
    
    
    static func myButtonBackgroundColor(forSchem scheme: ColorScheme) ->
    Color{
        
        let lightColor = Color.purple
        let darkColor = Color.init(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
      
        }
    }
}


