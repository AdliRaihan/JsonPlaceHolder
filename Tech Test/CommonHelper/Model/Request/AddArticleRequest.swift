//
//  AddArticleRequest.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
struct AddArticleRequestContext: Encodable {
    var title: String?
    var body: String?
    // NOTE: userId?
    var userId: Int?
    // karena cuma ada satu request model jadi fungsi convertnya disimpan disini
    func json() -> String? {
        let jsonEncoded = try? JSONEncoder().encode(self)
        if let data = jsonEncoded {
            return String.init(data: data, encoding: .utf8)
        } else {
            return nil
        }
    }
}
