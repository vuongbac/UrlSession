//
//  Data.swift
//  Api
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

struct ListUser: Codable {
    var data:[User]
}

struct User: Codable {
    var userName: String
    var image: String
    var location: String
    var age: Int
    var gender: String
}
