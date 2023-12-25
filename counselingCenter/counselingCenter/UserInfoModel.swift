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
    var specializedField: [Field]?
    
    private init() {
        
    }
}

enum Field: String {
    case religion = "종교"
    case school = "학교"
    case dating = "연애"
    case realEstate = "부동산"
    case politics = "정치"
    case life = "인생"
}
