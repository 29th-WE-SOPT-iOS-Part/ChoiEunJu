//
//  ResultViewController.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Vars & Lets Part
    
    var name: String?
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    // MARK: - Custom Method Part
    
    func setNameInLabel(){
        if let data = name {
            nameLabel.text = data + "님 환영합니다!"
            nameLabel.sizeToFit() 
        }
    }
    
    // MARK: - IBAction Part
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? NavigationController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    @IBAction func touchUpToGoTabBar(_ sender: Any) {
        let tabBarStoryBoard = UIStoryboard.init(name: "TabBar", bundle: nil)
        guard let nextSB = tabBarStoryBoard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
        
        nextSB.modalPresentationStyle = .fullScreen
        present(nextSB, animated: true, completion: nil)
    }    
}
