//
//  ResultViewController.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    func setNameInLabel(){
        if let data = name {
            nameLabel.text = data + "님 환영합니다!"
            nameLabel.sizeToFit() 
        }
    }
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
}
