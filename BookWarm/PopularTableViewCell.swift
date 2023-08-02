//
//  PopularTableViewCell.swift
//  BookWarm
//
//  Created by 이은서 on 2023/08/03.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet var popularMoviePosterImageView: UIImageView!
    @IBOutlet var popularMovieTitleLabel: UILabel!
    @IBOutlet var popularMovieSubTitleLabel: UILabel!
    
    func configPopularMovieTableView(row: Movie) {
        popularMovieTitleLabel.text = row.title
        popularMovieSubTitleLabel.text = "\(row.releaseDate) | \(row.runtime)분 | \(row.rate)점"
        popularMoviePosterImageView.image = UIImage(named: row.title)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
