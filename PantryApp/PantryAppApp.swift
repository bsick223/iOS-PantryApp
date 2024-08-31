//
//  PantryAppApp.swift
//  PantryApp
//
//  Created by Brendan Sick on 8/30/24.
//

import SwiftUI
import Firebase


@main
struct PantryAppApp: App {
    @StateObject var dataManager = DataManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
