//
//  AppDelegate.swift
//  PantryApp
//
//  Created by Brendan Sick on 8/31/24.
//
//
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Firebase initialization (if not already done in your @main struct)
        FirebaseApp.configure()
        return true
    }
}
