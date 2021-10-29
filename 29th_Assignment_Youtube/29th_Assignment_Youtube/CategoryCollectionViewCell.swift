//
//  CategoryCollectionViewCell.swift
//  29th_Assignment_Youtube
//
//  Created by EUNJU on 2021/10/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabel()
    }
    
    func setCategoryData(categoryData: String) {
        categoryLabel.text = categoryData
    }
}

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
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.widthAnchor.constraint(equalToConstant: 46).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    }

}
