//
//  UserProfilePresenter.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class UserProfilePresenter: UserProfilePresenterModel {
    private var view: UserProfileViewModel?
    init(view: UserProfileViewModel) {
        self.view = view
    }
    func presentUserDetails(data: UserModel) {
        self.view?.displayUserDetails(views: self.createUserInformationUIHolder(dataSource: data))
    }
    func presentUserAlbum(data: [AlbumsModel]) {
        self.view?.displayAlbums(views: CollectionViewHolder.instatiateView(data: data, title: "Albums"))
    }
    func presentTasksFailed(message: String?) {
        self.view?.displayTaskFailed(message: message)
    }
}
// MARK: Extension
// Extension ini untuk membuat UI dari API present userdetails
extension UserProfilePresenter {
    private func createUserInformationUIHolder(dataSource: UserModel) -> [UIView] {
        return [
            SmallHeaderLabelView.instatiateView(lVal: dataSource.name, contentSetup: .header, displaySeparator: true),
            createPhoneNumberValue(value: dataSource.phone ?? ""),
            SmallHeaderLabelView.instatiateView(lVal: "Tempat Tinggal", rVal: self.createAddressFromAddress(addr: dataSource.address), displaySeparator: true),
            SmallHeaderLabelView.instatiateView(lVal: "Detail Perusahaan", rVal: self.createCompanyDetails(comp: dataSource.company)),
        ]
    }
    // Hanya phone number yang memiliki logic dan perlu inisialisasi
    private func createPhoneNumberValue(value: String) -> UIView {
        let formattedValue = value.split(separator: " ").first?.lowercased() ?? ""
        let phoneNumber = SmallHeaderLabelView.instatiateView(lVal: "Nomor Telefon", rVal: formattedValue, contentSetup: .smallHeader)
        phoneNumber.createGesture {
            [weak self] in
            self?.view?.displayClickedEntity(value: formattedValue)
        }
        return phoneNumber
    }
    private func createAddressFromAddress(addr: UserModelAddress?) -> String {
        return "\(addr?.street ?? "") \(addr?.suite ?? ""), \(addr?.city ?? "") - \(addr?.zipcode ?? "")"
    }
    private func createCompanyDetails(comp: UserModelCompany?) -> String {
        return "\(comp?.name ?? "")\n\(comp?.catchPhrase ?? "")\n\(comp?.bs ?? "")"
    }
}
