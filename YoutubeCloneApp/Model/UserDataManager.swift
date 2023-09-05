//
//  UserDataManager.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0048 on 2023/09/05.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    private init() {}
    
    // 데이터를 UserDefaults에 저장
    private func saveUserData(_ users: [UserModel]) {
        if let encodedData = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encodedData, forKey: "users")
        }
    }
    
    // 데이터 파싱
    func getUsers() -> [UserModel] {
        if let userData = UserDefaults.standard.data(forKey: "users"),
           let users = try? JSONDecoder().decode([UserModel].self, from: userData)
        {
            return users
        }
        return []
    }
    
    func addUser(_ user: UserModel) {
        var users = getUsers()
        users.append(user)
        saveUserData(users)
    }
    
    func updateUser(name: String, newName: String) {
        var users = getUsers()
        if let index = users.firstIndex(where: { $0.name == name }) {
            users[index].name = newName
            saveUserData(users)
        }
    }
}
