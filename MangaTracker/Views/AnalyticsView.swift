//
//  AnalyticsView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        VStack {
            TitleBarView(titleText: "Analytics")
            
            Button("Visit Site") {
                
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .font(Font.system(size: 10).bold())
            .background(Color.blue.opacity(1))
            .clipShape(Capsule())
            .foregroundColor(.white)
            
        }
        
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
