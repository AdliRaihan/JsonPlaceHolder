//
//  CreateArticleProtocol.swift
//  Tech Test
//
//  Created by Adli Raihan on 15/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
protocol CreateArticleViewModel: class {
    func displayArticleAdded(model: PostModel)
    func displayTaskFailed(message: String?)
}
protocol CreateArticlePresenterModel: class {
    func presentArticleAdded(data: PostModel)
    func presentTaskFailed(message: String?)
}
protocol CreateArticleBusinessModel: class {
    func setArticle(requestRaw: [String: String?])
}
