//
//  ImagesCollectionCellCollectionViewCell.swift
//  Tech Test
//
//  Created by Adli Raihan on 14/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class ImagesCollectionCell: UICollectionViewCell {
    public static var identifier = "ImagesCollectionCell"
    @IBOutlet private weak var imageView: UIImageView?
    @IBOutlet private weak var imageDescription: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func load(imageDescription: String?) {
        self.imageDescription?.setNotesFont(weight: .semibold)
        self.imageDescription?.text = imageDescription
    }
    func attachImage(image: UIImage?) {
        self.imageView?.image = image ?? UIImage()
    }
}
