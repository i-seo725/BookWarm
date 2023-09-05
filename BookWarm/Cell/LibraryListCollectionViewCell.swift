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
    
    func configCell(row: Book) {
        
        titleLabel.text = row.title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        rateLabel.text = "\(row.author) | \(row.publisher)"
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 14)
        posterImageView.image = UIImage(named: row.title)
        
        layer.cornerRadius = 15
        backgroundColor = UIColor(red: row.colorR, green: row.colorG, blue: row.colorB, alpha: 1)
        
        let image = row.like == true ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(image, for: .normal)
    }
}
