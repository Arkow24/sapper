//
//  UserModel.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import Foundation
import UIKit


struct UserModel {
    
    var name: String
    var positions: [Int]
   
    
    init(name: String) {
        self.name = name
        self.positions = []
    }
    
    init(name: String, positions: [Int]) {
        self.name = name
        self.positions = positions
    }    
}


