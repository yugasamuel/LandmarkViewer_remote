//
//  LandmarkViewerApp.swift
//  LandmarkViewer
//
//  Created by Yuga Samuel on 22/03/23.
//

import SwiftUI

@main
struct LandmarkViewerApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
