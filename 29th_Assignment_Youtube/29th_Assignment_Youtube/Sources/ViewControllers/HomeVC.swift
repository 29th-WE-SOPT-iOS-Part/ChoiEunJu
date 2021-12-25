//
//  HomeVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/28.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var profileButton: UIButton!
    
    // MARK: - Vars & Lets Part
    
    var homeContentList: [HomeContentData] = []
    var channelList: [ChannelData] = []
    var categoryList = [String]()
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataList()
        setTableView()
        setCollectionView()
    }
    
    // MARK: - IBAction Part

    @IBAction func touchUpToGoSignInVC(_ sender: Any) {
        let MainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = MainStoryBoard.instantiateViewController(withIdentifier: NavigationController.className) as? NavigationController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method Part
    
    func setTableView() {
        let homeTableXib = UINib(nibName: HomeTableViewCell.className, bundle: nil)
        homeTableView.register(homeTableXib, forCellReuseIdentifier: HomeTableViewCell.className)
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    func setCollectionView() {
        let subscribeCollectionXib = UINib(nibName: HomeCollectionViewCell.className, bundle: nil)
        homeCollectionView.register(subscribeCollectionXib, forCellWithReuseIdentifier: HomeCollectionViewCell.className)
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        let categoryXib = UINib(nibName: CategoryCollectionViewCell.className, bundle: nil)
        categoryCollectionView.register(categoryXib, forCellWithReuseIdentifier: CategoryCollectionViewCell.className)
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    func initDataList() {
        homeContentList.append(contentsOf: [
            HomeContentData(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
            HomeContentData(videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", videoSubTitle: "WE SOPT ・조회수 100만회 ・ 3주 전", thumbnailImageName: "wesoptiOSPart1", profileImageName: "wesoptProfile"),
        ])
        
        channelList.append(contentsOf: [
            ChannelData(channelTitle: "iOSPart", channelImageName: "ggamju1"),
            ChannelData(channelTitle: "ServerPart", channelImageName: "ggamju2"),
            ChannelData(channelTitle: "AndroidPart", channelImageName: "ggamju3"),
            ChannelData(channelTitle: "DesignPart", channelImageName: "ggamju4"),
            ChannelData(channelTitle: "WebPart", channelImageName: "ggamju5"),
            ChannelData(channelTitle: "PlanPart", channelImageName: "ggamju6"),
        ])
        
        categoryList.append(contentsOf: [
            "전체", "오늘", "이어서 시청하기", "시청하기 않음", "실시간", "게시물"
        ])
    }
}

// MARK: - Extension Part

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.className) as? HomeTableViewCell else {return UITableViewCell()}
        
        cell.setData(homeData: homeContentList[indexPath.row])
        cell.videoDelegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeVC: videoCellDelegate {
    func tapThumbnailImage(cell: HomeTableViewCell) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: VideoDetailVC.className) as? VideoDetailVC else { return }
        
        nextVC.receivedVideoImage = cell.thumbnailImageView.image
        nextVC.receivedTitleLabel = cell.titleLabel.text
        nextVC.receivedSubtitleLabel = cell.subTitleLabel.text
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: categoryList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 32)
            
        } else {
            return CGSize(width: 72, height: 104)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionView == categoryCollectionView ? UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13) : UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView == categoryCollectionView ? 9 : 0
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == categoryCollectionView ? categoryList.count : channelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.className, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setCategoryData(categoryData: categoryList[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.className, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(channelData: channelList[indexPath.row])
            return cell
        }
    }
}
