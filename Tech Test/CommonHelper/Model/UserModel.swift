//
//  PostModel.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
struct UserModel: Decodable {
    let userId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
    let website: String?
    let username: String?
    let company: UserModelCompany?
    let address: UserModelAddress?
}
struct UserModelCompany: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
struct UserModelAddress: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: UserModelGeo?
}
struct UserModelGeo: Decodable {
    let lat: String
    let lng: String
}
