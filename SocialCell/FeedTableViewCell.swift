//
//  SocialCell - FeedTableViewCell.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var feed: Feed! {
        didSet {
            profileImageView?.image = feed.author.profileImage
            authorLabel?.text = feed.author.name
            timeLabel?.text = feed.time
            contentTextLabel?.text = feed.contents.text
            contentImageView?.image = feed.contents.image
            likesLabel?.text = "\(feed.likes)"
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
        selectionStyle = .none

        profileImageView = UIImageView(image: UIImage(systemName: "person.fill"))
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFit

        authorLabel = UILabel()
        // 사용자 글꼴 설정에 따라 글씨 크기가 조절되게 설정
        authorLabel.adjustsFontForContentSizeCategory = true
        authorLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        authorLabel.textColor = .black
        // 작성자는 중요하기때문에.. 나중에 다른 뷰와의 경쟁에서 이길 수 있게(?) compression resistance를 required로 설정
        authorLabel.setContentCompressionResistancePriority(.required,
                                                            for: .horizontal)
        authorLabel.setContentCompressionResistancePriority(.required,
                                                            for: .vertical)
        authorLabel.text = "작성자"

        timeLabel = UILabel()
        // 사용자 글꼴 설정에 따라 글씨 크기가 조절되게 설정
        timeLabel.adjustsFontForContentSizeCategory = true
        timeLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        timeLabel.textColor = .darkGray
        timeLabel.setContentCompressionResistancePriority(.defaultHigh,
                                                            for: .horizontal)
        timeLabel.setContentCompressionResistancePriority(.required,
                                                            for: .vertical)
        timeLabel.text = "1분 전"

        let profileStack = UIStackView(arrangedSubviews: [profileImageView, authorLabel, timeLabel])
        profileStack.axis = .horizontal
        profileStack.spacing = UIStackView.spacingUseSystem

        contentTextLabel = UILabel()
        contentTextLabel.adjustsFontForContentSizeCategory = true
        contentTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
        contentTextLabel.textColor = .black
        contentTextLabel.numberOfLines = 0
        contentTextLabel.text = """
            여러줄
            텍스트
            토스트
        """

        contentImageView = UIImageView(image: UIImage(systemName: "photo"))
        // 이미지의 크기가 프레임을 벗어나면 벗어난만큼 자르기
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.isUserInteractionEnabled = true

        let likesImageView = UIImageView(image: UIImage(systemName: "hand.thumbsup.fill"))
        likesImageView.tintColor = .systemBlue
        likesImageView.contentMode = .scaleAspectFit
        likesImageView.setContentHuggingPriority(.required,
                                                 for: .horizontal)

        likesLabel = UILabel()
        likesLabel.adjustsFontForContentSizeCategory = true
        likesLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        likesLabel.textColor = .darkGray
        likesLabel.text = "999"

        let likesStack = UIStackView(arrangedSubviews: [likesImageView, likesLabel])
        likesStack.alignment = .center
        likesStack.distribution = .fill
        likesStack.axis = .horizontal
        likesStack.spacing = UIStackView.spacingUseSystem

        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .center

        ["좋아요", "댓글 달기", "공유하기"].forEach { (title) in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tintColor = .darkGray
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.gray.cgColor
            buttonStack.addArrangedSubview(button)
        }


        let contentStack = UIStackView(arrangedSubviews: [profileStack, contentTextLabel, contentImageView, likesStack, buttonStack])

        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.alignment = .fill
        contentStack.distribution = .fill
        contentStack.spacing = UIStackView.spacingUseSystem
        contentView.addSubview(contentStack)

        
    }
    
    @objc private func tapImageView(_ sender: UITapGestureRecognizer) {
        
    }
}
