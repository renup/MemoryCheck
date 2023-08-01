//
//  MemoryCheckApp.swift
//  MemoryCheck
//
//  Created by Renu A Punjabi on 7/30/23.
//

import SwiftUI

@main
struct MemoryCheckApp: App {
//    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView(viewModel: viewModel) //Leaking memory
            ButtonsView() // not leaking memory
        }
    }
}
