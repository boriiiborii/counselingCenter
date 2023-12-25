//
//  UserInfoModel.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/25.
//

import Foundation
import KakaoSDKUser

class UserInfoModel {
    static let share = UserInfoModel()
    var name: String?
    var nickName: String?
    var gender: Gender?
    var profilImageUrl: URL?
    var age: AgeRange?
    var email: String?
    
    private init() {
        
    }
}
