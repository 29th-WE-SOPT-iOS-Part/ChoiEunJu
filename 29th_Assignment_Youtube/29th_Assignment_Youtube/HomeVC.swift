//
//  HomeVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/28.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var homeContentList: [HomeContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeContentList()
        registerXib()
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    func registerXib() {
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
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
