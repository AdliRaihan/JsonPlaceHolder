//
//  CommentModel.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class CommentModel: Decodable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
