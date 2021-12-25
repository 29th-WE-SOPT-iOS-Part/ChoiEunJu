//
//  VideoDetailVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/12/22.
//

import UIKit

class VideoDetailVC: UIViewController {
    
    // MARK: - Vars & Lets Part
    
    var receivedVideoImage: UIImage?
    var receivedTitleLabel: String?
    var receivedSubtitleLabel: String?

    // MARK: - UI Component Part
    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoData()
    }
    
    // MARK: - IBAction Part
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Custom Method Part
    
    func setUpVideoData() {
        videoImageView.image = receivedVideoImage
        titleLabel.text = receivedTitleLabel
        subTitleLabel.text = receivedSubtitleLabel
    }
}
