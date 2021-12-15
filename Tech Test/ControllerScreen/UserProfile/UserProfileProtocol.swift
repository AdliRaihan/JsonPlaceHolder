//
//  UserProfileProtocol.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
protocol UserProfileViewModel {
    var userDetails: UserModel? { get }
    func displayUserDetails(views: [UIView])
    func displayClickedEntity(value: String)
    func displayAlbums(views: CollectionViewHolder)
    func displayTaskFailed(message: String?)
}
protocol UserProfileBusinessModel {
    func getUserDetails()
    func getUserAlbums()
}
protocol UserProfilePresenterModel {
    func presentUserDetails(data: UserModel)
    func presentUserAlbum(data: [AlbumsModel])
    func presentTasksFailed(message: String?)
}
protocol UserProfileDataRouter {
    var userID: Int { get }
}
