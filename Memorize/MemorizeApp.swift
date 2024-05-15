//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Howard's Mac mini on 5/6/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
