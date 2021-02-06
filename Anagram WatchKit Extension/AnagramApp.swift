//
//  AnagramApp.swift
//  Anagram WatchKit Extension
//
//  Created by Joshua Homann on 2/3/21.
//

import SwiftUI

@main
struct AnagramApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
