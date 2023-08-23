//
//  SplashView.swift
//  Rick&Morty
//
//  Created by Samuel Gamero on 19/8/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                CharactersView()
            }else{
                Image("rick_splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
