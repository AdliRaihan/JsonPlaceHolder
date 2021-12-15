//
//  CollectionViewHolder.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//

import UIKit

class CollectionViewHolder: UIView {
    @IBOutlet private weak var contentView: UIView?
    @IBOutlet private weak var headerLabel: UILabel?
    @IBOutlet private weak var collectionView: UICollectionView?
    private var albumsData: [AlbumsModel] = []
    private var title: String = ""
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    public static func instatiateView(data: [AlbumsModel], title: String) -> CollectionViewHolder {
        let displayer = CollectionViewHolder()
        displayer.albumsData = data
        displayer.title = title
        return displayer
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        getDisplay()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getDisplay()
    }
    func getDisplay() {
        Bundle.main.loadNibNamed("CollectionViewHolder", owner: self, options: nil)
        if let contentView = contentView {
            addSubview(contentView)
        }
        contentView?.frame = self.bounds
        contentView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.headerLabel?.setDescriptionFont(weight: .semibold)
        self.loadCell()
    }
    func load() {
        guard self.albumsData.count > 0 else { return }
        self.headerLabel?.text = title
        self.collectionView?.reloadData()
    }
}
extension CollectionViewHolder: UICollectionViewDelegate, UICollectionViewDataSource {
    private func loadCell() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView?.collectionViewLayout = layout
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        let uiNib = UINib(nibName: ImagesCollectionCell.identifier, bundle: Bundle.main)
        self.collectionView?.register(uiNib, forCellWithReuseIdentifier: ImagesCollectionCell.identifier)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumsData.count - 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = self.albumsData[indexPath.row]
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionCell.identifier, for: indexPath) as? ImagesCollectionCell
        cell?.load(imageDescription: index.title)
        Network.shared.loadImage(url: index.thumbnailUrl ?? "") { [weak cell] (image) in
            cell?.attachImage(image: image)
        }
        cell?.backgroundColor = .black
        return cell ?? UICollectionViewCell()
    }
}
extension CollectionViewHolder: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let squared = self.collectionView?.frame.height ?? 50.0
        return .init(width: squared, height: squared)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16.0, bottom: 0, right: 16.0)
    }
}
