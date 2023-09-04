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
    
    func configPopularMovieTableView(row: BookTable) {
        popularMovieTitleLabel.text = row.title
        popularMovieSubTitleLabel.text = "\(row.author) | \(row.publisher)"

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
