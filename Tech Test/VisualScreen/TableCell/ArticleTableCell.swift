//
//  ArticleTableCell.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class ArticleTableCell: UITableViewCell {
    public static var identifier = "ArticleTableCell"
    @IBOutlet private weak var usernameLabel: UILabel?
    @IBOutlet private weak var companyLabel: UILabel?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ArticleTableCell.identifier)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.usernameLabel?.setDescriptionFont(weight: .bold)
        self.companyLabel?.setDescriptionFont(weight: .semibold)
        self.titleLabel?.setTitleFont()
        self.descriptionLabel?.setDescriptionFont()
    }
    public func loadPosts(data: PostModel?, grayed: Bool = false) {
        guard let data = data else { return }
        if grayed {
            self.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        }
        self.titleLabel?.text = data.title
        self.descriptionLabel?.text = data.body
    }
    public func loadAuthor(data: UserModel?) {
        guard let data = data else { return }
        self.usernameLabel?.text = data.username
        self.companyLabel?.text = data.company?.name
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentView.backgroundColor = .white
    }
}
