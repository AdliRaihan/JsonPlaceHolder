//
//  NetworkProtocol.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
enum NetworkResults<T: Decodable> {
    case success(json: T)
    case failed(error: Error?)
}
