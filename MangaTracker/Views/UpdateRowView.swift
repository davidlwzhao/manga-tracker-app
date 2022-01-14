//
//  UpdateRowView.swift
//  MangaTracker
//
//  Created by David Zhao on 14/01/2022.
//

import SwiftUI

struct UpdateRowView: View {
    
    let u: Update
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            HStack(alignment: .top, spacing: 10) {
                Image("\(u.title)-\(u.source)")
                    .resizable()
                    .frame(width: 100, height: 130)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 5) {
                    Text(u.title)
                        .font(.caption)
                        .bold()
                    Text("Source: \(u.source)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)
                    
                    ZStack {
                        Capsule()
                            .fill(.blue)
                            .opacity(0.8)
                            
                        HStack {
                            Spacer()
                            Text("Chapter \(Int(u.chapter))")
                                .foregroundColor(.white)
                                .font(Font.system(size: 10))
                            Spacer()
                            Text("\(u.date)")
                                .foregroundColor(.white)
                                .font(Font.system(size: 10))
                            Spacer()
                        }
                    }
                    .frame(width: 200, height: 25)
                    
                }
                .padding(.leading, 10)
                
            }
        }
        .padding(.horizontal, 5)
    }
}

struct UpdateRowView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateRowView(u: Update())
    }
}
