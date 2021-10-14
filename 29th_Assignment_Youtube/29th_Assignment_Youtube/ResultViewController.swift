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
            nameLabel.text = data + "님"
            nameLabel.sizeToFit() 
        }
    }
}
