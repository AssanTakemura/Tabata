//
//  Comment.swift
//  Tabata
//
//  Created by 竹村明日香 on 2020/10/17.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit
import Firebase

struct User {
    var name: String = ""
    var tore: String = "トレーニングしたよ！"
    
    mutating func setFromDictionary(_ dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? ""
        tore = dictionary["tore"] as? String ?? "トレーニングしたよ！"
    }
    
    var toDictionary: [String: Any] {
        return ["name": name, "tore": tore]
    }
    
}

