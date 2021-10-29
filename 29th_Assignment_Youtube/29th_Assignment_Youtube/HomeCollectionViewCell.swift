//
//  HomeCollectionViewCell.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/29.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"

    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(channelData: ChannelData) {
        channelImageView.image = channelData.makeChannelImage()
        channelNameLabel.text = channelData.channelTitle
    }

}
