//
//  AppDelegate.swift
//  Parstagram
//
//  Created by Myat Thu Ko on 3/17/21.
//

import Parse
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Thread.sleep(forTimeInterval: 2.5)
        // Getting API Key from plist
        guard let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist") else {
            fatalError("Couldn't find file 'Keys.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let appID = plist?.object(forKey: "app_id") as? String else {
            fatalError("Couldn't find key 'app_id' in 'Keys.plist'.")
        }
        
        guard let clientKey = plist?.object(forKey: "client_key") as? String else {
            fatalError("Couldn't find key 'client_key' in 'Keys.plist'.")
        }
        
        // Configurating Parse Database
        
        let parseConfig = ParseClientConfiguration {
            $0.applicationId = appID
            $0.clientKey = clientKey
            $0.server = "https://parseapi.back4app.com"
        }
        
        Parse.initialize(with: parseConfig)
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

