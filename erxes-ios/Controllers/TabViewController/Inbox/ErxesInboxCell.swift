//
//  ErxesInboxCell.swift
//  Erxes.io
//
//  Created by soyombo bat-erdene on 2/16/18.
//  Copyright © 1618 soyombo bat-erdene. All rights reserved.
//

import UIKit
import SnapKit

class ErxesInboxCell: UITableViewCell {

    var message: ErxesLabel!
    var date: ErxesLabel!
    var avatar: UIImageView!
    var fullName: ErxesLabel!
    var desc: ErxesLabel!
    var tagListView: TagListView!
    var circleView: UIView!
    var iconView: UIImageView!
    var userAvatar: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

        avatar = UIImageView()
        avatar.layer.cornerRadius = 6
        avatar.clipsToBounds = true
        avatar.backgroundColor = UIColor.SHIMMER_COLOR
        contentView.addSubview(avatar)


        fullName = ErxesLabel()
        fullName.textAlignment = .left
        fullName.textColor = UIColor.ERXES_COLOR
        fullName.font = UIFont.fontWith(type: .medium, size: 14)
        fullName.backgroundColor = UIColor.SHIMMER_COLOR
        contentView.addSubview(fullName)


        desc = ErxesLabel()
        desc.textAlignment = .right
        desc.textColor = .gray
        desc.font = UIFont.fontWith(type: .thin, size: 14)
        desc.backgroundColor = UIColor.SHIMMER_COLOR
        desc.minimumScaleFactor = 0.5
        desc.adjustsFontSizeToFitWidth = true
        contentView.addSubview(desc)


        date = ErxesLabel()
        date.font = UIFont.fontWith(type: .thin, size: 14)
        date.textAlignment = .right
        date.textColor = .gray
        date.numberOfLines = 0
        date.lineBreakMode = .byCharWrapping
        date.font = date.font.withSize(10)
        contentView.addSubview(date)



        message = ErxesLabel()
        message.textAlignment = .left
        message.textColor = UIColor.TEXT_COLOR
//        message.textColor = UIColor(hexString: "#60d2d6")
        message.font = UIFont.fontWith(type: .light, size: 14)
        message.numberOfLines = 2
        message.minimumScaleFactor = 0.5
        message.backgroundColor = .red
        message.lineBreakMode = .byWordWrapping
        message.backgroundColor = UIColor.SHIMMER_COLOR
        contentView.addSubview(message)


        tagListView = TagListView()
        tagListView.tagBackgroundColor = UIColor.ERXES_COLOR
        tagListView.cornerRadius = 5.0
        tagListView.textFont = UIFont(name: "Montserrat-Light", size: 8)!
        tagListView.textColor = .white
        tagListView.clipsToBounds = false

        contentView.addSubview(tagListView)


        circleView = UIView()
        circleView.layer.cornerRadius = 10
        circleView.clipsToBounds = true
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.layer.borderWidth = 0.7
        contentView.addSubview(circleView)
        
        iconView = UIImageView()
        iconView.layer.cornerRadius = 7
        iconView.clipsToBounds = true
        circleView.addSubview(iconView)
        
        userAvatar = UIImageView()
        userAvatar.layer.cornerRadius = 10
        userAvatar.clipsToBounds = true
        contentView.addSubview(userAvatar)
    }

    func clearColor() {
        message.backgroundColor = .clear
        date.backgroundColor = .clear
        desc.backgroundColor = .clear
        fullName.backgroundColor = .clear
        avatar.backgroundColor = UIColor.ERXES_COLOR

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.snp.makeConstraints { (make) in

            make.left.equalTo(contentView.snp.left).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.height.equalTo(46)
        }
        fullName.snp.makeConstraints { (make) in
            make.left.equalTo(avatar.snp.right).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.height.equalTo(16)

        }
        desc.snp.makeConstraints { (make) in
            make.left.equalTo(avatar.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).inset(10)
            make.bottom.equalTo(avatar.snp.bottom)
        }
        date.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).inset(10)
            make.top.equalTo(contentView.snp.top).inset(10)
            make.height.equalTo(16)
            make.left.equalTo(fullName.snp.left).offset(10)
        }

        tagListView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).inset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(6)
            make.height.equalTo(20)
        }

        message.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).inset(35)
            make.top.equalTo(avatar.snp.bottom).offset(5)
            make.bottom.equalTo(tagListView.snp.top).inset(-5)
        }

        circleView.snp.makeConstraints { (make) in
            make.left.equalTo(avatar.snp.right).inset(15)
            make.top.equalTo(avatar.snp.bottom).inset(15)
            make.width.height.equalTo(20)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(14)
        }
        
        userAvatar.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).inset(10)
            make.width.height.equalTo(20)
            make.top.equalTo(message.snp.top)
            
        }

        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }



    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setIcon(type: integrationKind) {
        switch type {
        case .messenger:
//            iconView.image = #imageLiteral(resourceName: "messenger")
            iconView.image = UIImage.erxes(with: .facebookmessengerlogo, textColor: UIColor.FB_COLOR)
            circleView.backgroundColor = UIColor.FB_COLOR
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
            
        case .form:
            iconView.image = UIImage.erxes(with: .file, textColor: UIColor.white)
            circleView.backgroundColor =   UIColor.init(hexString: "f8cf5f")
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
        case .feed:
            iconView.image = UIImage.erxes(with: .facebooklogo, textColor: UIColor.FB_COLOR)
            circleView.backgroundColor = UIColor.FB_COLOR
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
        case .user:
            iconView.image = UIImage.erxes(with: .chat, textColor: UIColor.ERXES_COLOR)
            circleView.backgroundColor = UIColor.ERXES_COLOR
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
            avatar.backgroundColor =  UIColor.init(hexString: "60d2d6")
            
        case .notuser:
//            iconView.image = #imageLiteral(resourceName: "user")
            iconView.image = UIImage.erxes(with: .speechbubble2, textColor: UIColor.ERXES_COLOR)
            circleView.backgroundColor = UIColor.ERXES_COLOR
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
           
        case .twitter:
            iconView.image = UIImage.erxes(with: .twitterlogo, textColor: UIColor.ERXES_COLOR)
            circleView.backgroundColor = UIColor.init(hexString: "139fef")
            iconView.image = iconView.image!.withRenderingMode(.alwaysTemplate)
        }
        iconView.tintColor = .white
    }

}

enum integrationKind {
    case messenger
    case form
    case feed
    case user
    case notuser
    case twitter
}
