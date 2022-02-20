//
//  Util.swift
//  MangaTracker
//
//  Created by David Zhao on 15/01/2022.
//

import SwiftUI
import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .font(Font.system(size: 10).bold())
            .background(Color.blue.opacity(1))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}
