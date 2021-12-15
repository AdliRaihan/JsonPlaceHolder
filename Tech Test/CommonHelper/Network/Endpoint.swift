//
//  Url.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
enum EndpointSection {
    case posts(id: String?)
    case postsComment(id: String)
    case userProfile(id: String)
    case albums(id: String)
    case comments
    case details
    case users
    case usersPosts
    
    func get() -> String {
        var selectedURL = ""
        switch self {
        case .posts(let id):
            selectedURL = "/posts"
            if let id = id {
                selectedURL = "/posts/\(id)"
            }
        case .postsComment(let id):
            selectedURL = "/posts/\(id)/comments"
        case .userProfile(let id):
            selectedURL = "/users/\(id)"
        case .albums(let id):
            selectedURL = "/albums/\(id)/photos"
        case .comments:
            selectedURL = "/comments"
        case .details:
            selectedURL = "details"
        case .usersPosts:
            selectedURL = "/posts/1/users"
        default: break
        }
        return Url.baseURL + selectedURL
    }
}
class Url {
    public static let baseURL = "https://jsonplaceholder.typicode.com"
}
