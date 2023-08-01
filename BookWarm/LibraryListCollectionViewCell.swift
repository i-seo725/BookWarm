//
//  LibraryListCollectionViewCell.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

class LibraryListCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    func configCell(row: Movie) {
        let color = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemOrange, UIColor.systemGreen, UIColor.systemYellow, UIColor.systemCyan, UIColor.systemGray, UIColor.systemMint, UIColor.systemPink, UIColor.systemBrown, UIColor.systemIndigo, UIColor.systemPurple]
        let randomColor = color.randomElement()!
        
        titleLabel.text = row.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        rateLabel.text = "\(row.rate)"
        rateLabel.textColor = .white
        posterImageView.image = UIImage(named: row.title)
        
        layer.cornerRadius = 15
        backgroundColor = randomColor
        
        let image = row.like == true ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(image, for: .normal)
    }
}
