//
//  HomeTableViewCell.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Vars & Lets Part
    
    static let identifier = "HomeTableViewCell"
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // MARK: - Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    // MARK: - Custom Method Part
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(homeData: HomeContentData) {
        thumbnailImageView.image = homeData.makeThumbnailImage()
        profileImageView.image = homeData.makeProfileImage()
        titleLabel.text = homeData.videoTitle
        subTitleLabel.text = homeData.videoSubTitle
    }
}

// MARK: - Extension Part

extension HomeTableViewCell {
    func setUI() {
        thumbnailImageView.contentMode = .scaleToFill
        titleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        titleLabel.numberOfLines = 0
        
        subTitleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
    }
}
