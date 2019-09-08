//
//  AppDelegate.swift
//  Todoey
//
//  Created by Adrian Cabrera on 31/08/2019.
//  Copyright © 2019 Adrian Cabrera. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

//        print(Realm.Configuration.defaultConfiguration.fileURL)

        do {
            _ = try Realm()
        } catch {
            print("Error initializing new real, \(error)")
        }
        
        return true
    }
}
