//
//  PostTableViewCell.swift
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: AMPost? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeCountLable: UILabel!
    @IBOutlet weak var commentCountLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        likeCountLable.text = "Number of Like: \(post.likeCount)"
        commentCountLable.text = "Number of Comments \(post.commentCount)"
    }
}
