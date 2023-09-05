//
//  UserDataManager.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/05.
//

import Foundation


class UserDataManager {
    static let shared = UserDataManager()

    func updateInfo(name: String){
        UserDefaults.standard.set(name, forKey: "userName")

    }

    
}
