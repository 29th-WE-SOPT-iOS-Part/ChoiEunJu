//
//  CategoryCollectionViewCell.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Component Part
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Vars & Lets Part
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                //select
                categoryLabel.layer.backgroundColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1).cgColor
                categoryLabel.textColor = .white
            } else {
                //unselect
                categoryLabel.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
                categoryLabel.textColor = .black
            }
        }
    }

    // MARK: - Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabel()
    }
    
    // MARK: - Custom Method Part
    
    func setCategoryData(categoryData: String) {
        categoryLabel.text = categoryData
    }
}

// MARK: - Extension Part

extension CategoryCollectionViewCell {
    func setLabel() {
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        categoryLabel.frame = CGRect(x: 0, y: 0, width: 46, height: 32)
        categoryLabel.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        categoryLabel.layer.cornerRadius = 16
        categoryLabel.layer.borderWidth = 1
        categoryLabel.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
        
        contentView.addSubview(categoryLabel)
    }
}
