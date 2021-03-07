//
//  UserInformation.swift
//  MySignUp
//
//  Created by Seunghun Yang on 2021/03/07.
//

import Foundation


class UserInformation {
    static let sharedUserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var bio: String?
    var phoneNumber: String?
    var birthday: String?
}
