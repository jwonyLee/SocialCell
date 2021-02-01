//
//  SocialCell - FeedTableViewCell.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var feed: Feed! {
        didSet {
            profileImageView.image = feed.author.profileImage
            authorLabel.text = feed.author.name
            timeLabel.text = feed.time
            contentTextLabel.text = feed.contents.text
            contentImageView.image = feed.contents.image
            likesLabel.text = "\(feed.likes)"
        }
    }
    
    private var profileImageView: UIImageView!
    private var authorLabel: UILabel!
    private var timeLabel: UILabel!
    private var contentTextLabel: UILabel!
    private var contentImageView: UIImageView!
    private var likesLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        drawCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FeedTableViewCell {
    
    private func drawCell() {
        
    }
    
    @objc private func tapImageView(_ sender: UITapGestureRecognizer) {
        
    }
}
