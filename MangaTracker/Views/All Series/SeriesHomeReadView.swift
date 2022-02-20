//
//  SeriesHomeReadView.swift
//  MangaTracker
//
//  Created by David Zhao on 15/01/2022.
//

import SwiftUI

struct SeriesHomeReadView: View {
    
    var url: String
    var title: String
    
    var body: some View {
        
        VStack {
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.top, 20)
                
                Divider()
            }
            .background(.black)
        
            WebView(url: URL(string: url)!)
                //.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(false)
    }
}
