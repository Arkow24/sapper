//
//  FirebaseClient.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//
import Foundation
import UIKit
import FirebaseDatabase

final class FirebaseClient {
    
    var ref: DatabaseReference = Database.database().reference()
    static let shared: FirebaseClient = .init()
    
    func fetchAllUsers(completion: @escaping ([UserModel]) -> Void) {
        ref.child("Users").getData { _, snapshot in
            
            guard let snapshot = snapshot else { return}
            var tab = []
            for snap in snapshot.children {
                let us = snap as! DataSnapshot
                let dis = us.key
                let dos = us.value as! [Int]
                let post = UserModel(name: dis, positions: dos)
                tab.append(post)
            }
            completion(tab as Any as! [UserModel])
            print(tab)
        }
    }
    
    func addUserToDataBase(value: UserModel?) {
        guard let value = value else {return}
        ref.child("Users").child(value.name).setValue(value.positions)
    }
    
    
}
