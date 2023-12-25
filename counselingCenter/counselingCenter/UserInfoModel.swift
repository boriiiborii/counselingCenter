//
//  UserInfoModel.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/25.
//

import Foundation

class UserInfoModel {
    var name: String?
    var nickName: String?
    var sex: Sex?
    var profilImageUrl: String?
    var age: Int?
    var email: String?
}

enum Sex {
    case man
    case woman
}
