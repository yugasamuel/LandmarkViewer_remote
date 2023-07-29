//
//  LandmarkList.swift
//  LandmarkViewer
//
//  Created by Yuga Samuel on 23/03/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var path = NavigationPath()
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(value: landmark) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationDestination(for: Landmark.self) { landmark in
                LandmarkDetail(landmark: landmark)
            }
            .navigationTitle("Landmark")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
