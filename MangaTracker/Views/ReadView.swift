//
//  ReadView.swift
//  MangaTracker
//
//  Created by David Zhao on 09/01/2022.
//

import SwiftUI

struct ReadView: View {
    
    let url: String
    
    var body: some View {
        VStack {
            VStack {
                Text("Title")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.top, 20)
                
                Divider()
                
                HStack (spacing: 10){
                    ZStack{
                        Capsule()
                            .fill(.blue)
                        HStack {
                            Image(systemName: "backward.end")
                            Text("Previous")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 120, height:30)
                    
                    ZStack{
                        Capsule()
                            .fill(.blue)
                        HStack {
                            Image(systemName: "escape")
                            Text("Skip")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 120, height:30)
                    
                    ZStack{
                        Capsule()
                            .fill(.blue)
                        HStack {
                            Text("Next")
                            Image(systemName: "forward.end")
                        }
                        .foregroundColor(.white)
                    }
                    .frame(width: 120, height:30)
                }
                .padding(.bottom, 10)
            }
            .background(.black)
            
            
            WebView(url: URL(string: url)!)
                //.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView(url: "https://flamescans.org/player-starting-from-today-chapter-37/")
    }
}

