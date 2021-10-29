//
//  HomeVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/28.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var homeContentList: [HomeContentData] = []
    var channelList: [ChannelData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeContentList()
        initChannelList()
        registerXib()
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
    }
    
    func registerXib() {
        let xibTableName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(xibTableName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        let xibCollectionName = UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil)
        homeCollectionView.register(xibCollectionName, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    func initHomeContentList() {
        homeContentList.append(contentsOf: [
            HomeContentData(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
        ])
    }
    
    func initChannelList() {
        channelList.append(contentsOf: [
            ChannelData(channelTitle: "iOSPart", channelImageName: "ggamju1"),
            ChannelData(channelTitle: "ServerPart", channelImageName: "ggamju2"),
            ChannelData(channelTitle: "AndroidPart", channelImageName: "ggamju3"),
            ChannelData(channelTitle: "DesignPart", channelImageName: "ggamju4"),
            ChannelData(channelTitle: "WebPart", channelImageName: "ggamju5"),
            ChannelData(channelTitle: "PlanPart", channelImageName: "ggamju6"),
        ])
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {return UITableViewCell()}
        
        cell.setData(homeData: homeContentList[indexPath.row])
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate {

}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(channelData: channelList[indexPath.row])
        return cell
    }
}
