//
//  ResultVC.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class ResultVC: UIViewController {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    // MARK: - Custom Method Part
    
    func setNameInLabel(){
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            nameLabel.text = "\(userName)님 환영합니다!"
            nameLabel.sizeToFit()
        }
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: NavigationController.className) as? NavigationController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoTabBar(_ sender: Any) {
        let tabBarStoryBoard = UIStoryboard.init(name: "TabBar", bundle: nil)
        guard let nextVC = tabBarStoryBoard.instantiateViewController(withIdentifier: TabBarController.className) as? TabBarController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }    
}
