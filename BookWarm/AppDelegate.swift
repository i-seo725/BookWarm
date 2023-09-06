//
//  AppDelegate.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = Realm.Configuration(schemaVersion: 4) { migration, oldSchemaVersoin in
            if oldSchemaVersoin < 1 { } // love column 추가
            if oldSchemaVersoin < 2 {   // status column 추가 및 기본값 지정
                migration.enumerateObjects(ofType: BookTable.className()) { oldObject, newObject in
                    guard let newObject else { return }
                    newObject["status"] = "정상판매"
                }
            }
            if oldSchemaVersoin < 3 { }
            if oldSchemaVersoin < 4 { }

        }
        
        Realm.Configuration.defaultConfiguration = config
        
//            migration.renameProperty(onType: Diary.className(), from: "photo", to: "photos")
//                migration.enumerateObjects(ofType: Diary.className()) { oldObject, newObject in
//                    guard let newObject else { return }
//                    guard let oldObject else { return }
//                    newObject["summary"] = "제목은 '\(oldObject["title"])'이고, 내용은 '\(oldObject["contentsBox"])'입니다"   //새 컬럼이 생길 때 기본값 넣기
//                }
        
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

