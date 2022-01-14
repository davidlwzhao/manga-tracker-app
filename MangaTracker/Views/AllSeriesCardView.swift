//
//  AllSeriesCardView.swift
//  MangaTracker
//
//  Created by David Zhao on 14/01/2022.
//

import SwiftUI

struct AllSeriesCardView: View {
    
    var s: Series
    
    var body: some View {
        ZStack {
            
            Image("\(s.title)-\(s.source)")
                .resizable()
                .frame(width: 110, height: 150)
                .cornerRadius(5)
        
            VStack(alignment: .center) {
                Spacer()
                
                HStack(spacing: 10) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(2)
                        
                        Text("Ch.\(Int(s.lastChapter))")
                            .foregroundColor(.white)
                            .font(Font.system(size: 6))
                            .bold()
                    }
                    .frame(width: 30, height: 20)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(2)
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 10, height: 10)
                        
                            Text("\(s.timeSinceUpdate) hrs ago")
                                .foregroundColor(.white)
                                .font(Font.system(size: 6))
                                .frame(width: 40)
                        }
                        .padding(.leading, 5)
                    }
                }
                .frame(width: 90, height: 20)
                //.padding(.horizontal, 10)
                
                Text(s.title)
                    .bold()
                    .font(.caption)
                    .lineLimit(2)
                    
            }
            .padding(.horizontal, 20)
            
        }
        .frame(width: 100, height: 220)
    }
}

