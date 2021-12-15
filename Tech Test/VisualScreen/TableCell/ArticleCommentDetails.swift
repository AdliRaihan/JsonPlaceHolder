//
//  ArticleCommentDetails.swift
//  Tech Test
//
//  Created by Adli Raihan on 13/12/21.
//  Copyright © 2021 Adli Raihan. All rights reserved.
//
import UIKit
class ArticleCommentDetails: UITableViewCell {
    public static var identifier = "ArticleCommentDetails"
    public var usernameCallback: (() -> Void)?
    @IBOutlet private weak var authorLabel: UILabel?
    @IBOutlet private weak var commentLabel: UILabel?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ArticleCommentDetails.identifier)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.authorLabel?.setDescriptionFont(weight: .semibold)
        self.commentLabel?.setNotesFont(weight: .regular)
    }
    public func loadComment(data: CommentModel?) {
        guard let data = data else { return }
        authorLabel?.text = data.name
        commentLabel?.text = data.body
    }
    // Private forbidden to use outside class
    @IBAction private func didTouchUsername(_ sender: Any) {
        self.usernameCallback?()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
