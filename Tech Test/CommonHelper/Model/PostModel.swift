//
//  PostModel.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
struct PostModel: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
