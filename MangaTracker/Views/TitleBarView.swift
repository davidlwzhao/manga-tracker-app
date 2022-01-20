//
//  TitleBarView.swift
//  MangaTracker
//
//  Created by David Zhao on 20/01/2022.
//

import SwiftUI

struct TitleBarView: View {
    var titleText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .bold()
                .padding(.top, 20)
            Divider()
        }
        .background(.black)
    }
}

struct TitleBarView_Previews: PreviewProvider {
    static var previews: some View {
        TitleBarView(titleText: "test")
    }
}
