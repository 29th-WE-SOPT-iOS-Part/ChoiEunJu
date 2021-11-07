//
//  HomeCollectionViewCell.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/29.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Vars & Lets Part
    
    static let identifier = "HomeCollectionViewCell"

    // MARK: - UI Component Part
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    
    // MARK: - Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Custom Method Part
    
    func setData(channelData: ChannelData) {
        channelImageView.image = channelData.makeChannelImage()
        channelNameLabel.text = channelData.channelTitle
    }
}

// MARK: - Extension Part

extension HomeCollectionViewCell {
    func setUI() {
        channelNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        channelNameLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
    }
}
