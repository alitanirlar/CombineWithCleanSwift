//
//  UserTableViewCell.swift
//  CombineWithCleanSwift
//
//  Created by Ali TANIRLAR on 22.07.2022.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    func configure(user: UsersModels.Users.ViewModel.DisplayedUser) {
        fullNameLabel.text = user.fullName
        avatarImageView.sd_setImage(with: user.avatarUrl)
    }
    
}
