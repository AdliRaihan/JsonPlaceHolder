//
//  UserProfileInteractor.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import Foundation
class UserProfileInteractor: UserProfileBusinessModel, UserProfileDataRouter {
    private var presenter: UserProfilePresenterModel?
    internal var userID: Int
    init(presenter: UserProfilePresenterModel, userID: Int) {
        self.userID = userID
        self.presenter = presenter
    }
    func getUserDetails() {
        WorkerHelper.init().getUserProfile(userId: "\(self.userID)") { [weak self] (result) in
            if case .success(let json) = result {
                self?.presenter?.presentUserDetails(data: json)
            } else {
                self?.presenter?.presentTasksFailed(message: nil)
            }
        }
    }
    func getUserAlbums() {
        WorkerHelper.init().getUserAlbums(userId: "\(self.userID)") { [weak self] (result) in
            if case .success(let json) = result {
                self?.presenter?.presentUserAlbum(data: json)
            } else {
                self?.presenter?.presentTasksFailed(message: nil)
            }
        }
    }
}
