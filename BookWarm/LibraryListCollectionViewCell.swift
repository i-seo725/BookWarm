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
        
        titleLabel.text = row.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        rateLabel.text = "\(row.rate)"
        rateLabel.textColor = .white
        posterImageView.image = UIImage(named: row.title)
        
        layer.cornerRadius = 15
        backgroundColor = UIColor(red: row.colorR, green: row.colorG, blue: row.colorB, alpha: 1)
        
        let image = row.like == true ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(image, for: .normal)
    }
}
