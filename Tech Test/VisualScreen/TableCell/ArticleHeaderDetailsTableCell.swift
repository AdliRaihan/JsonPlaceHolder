//
//  ArticleHeaderDetailsTableCell.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class ArticleHeaderDetailsTableCell: UITableViewCell {
    public static var identifier = "ArticleHeaderDetailsTableCell"
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ArticleHeaderDetailsTableCell.identifier)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel?.setTitleFont()
        self.descriptionLabel?.setDescriptionFont()
    }
    public func loadInformation(data: PostModel?) {
        guard let data = data else { return }
        self.titleLabel?.text = data.title
        self.descriptionLabel?.text = data.body
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
