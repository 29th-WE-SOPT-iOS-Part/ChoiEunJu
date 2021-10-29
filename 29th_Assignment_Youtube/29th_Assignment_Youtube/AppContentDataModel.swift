//
//  AppContentDataModel.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/28.
//

import UIKit

struct HomeContentData {
    let videoTitle: String
    let videoSubTitle: String
    let thumbnailImageName: String
    let profileImageName: String
    
    func makeThumbnailImage() -> UIImage? {
        return UIImage(named: thumbnailImageName)
    }
    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
}

struct ChannelData {
    let channelTitle: String
    let channelImageName: String
    
    func makeChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
}
