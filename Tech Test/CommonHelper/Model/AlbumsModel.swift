//
//  AlbumsModel.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
struct AlbumsModel: Decodable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
