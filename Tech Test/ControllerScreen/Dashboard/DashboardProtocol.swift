//
//  DashboardProtocol.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
protocol DashboardBusinessModel: class {
    func getPostsArticle()
    func getUserArticle()
}
protocol DashboardPresenterModel: class {
    func presentPostsArticle(data: [PostModel])
    func presentUserArticle(data: [UserModel])
    func presentTasksFailed(message: String?)
}
protocol DashboardViewModel: class {
    var screenData: [ArticleModel]? { get }
    func displayPostsArticle(model: [PostModel])
    func displayAuthorArticle(model: [UserModel])
    func displayTaskFailed(message: String?)
}
