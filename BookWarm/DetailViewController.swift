//
//  DetailViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

enum transition {
    case push
    case present
}

class DetailViewController: UIViewController {

    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var titleScoreLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var backView: UIView!
    
    var transitionType: transition = .push
    var getTitle: String = "빈 제목"
    var getPosterImage: String = "빈 영화 포스터"
    var getLikeImage: Bool = true
    var getTitleScore: String = "빈 정보"
    var getContent: String = "빈 내용"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = getTitle
        posterImageView.image = UIImage(named: getPosterImage)
        
        let like = getLikeImage == true ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeImageView.image = like
        likeImageView.tintColor = .systemRed
        titleScoreLabel.text = getTitleScore
        contentLabel.text = getContent
        contentLabel.numberOfLines = 15
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        
        backView.backgroundColor = .systemGray5
        
//        setTransition()
        // 이건 모달 방식일 때 하는 설정인듯!
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(backButtonTapped))
//        navigationItem.
//        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func getData(row: Movie) {
        getTitle = row.title
        getPosterImage = row.title
        getLikeImage = row.like
        getTitleScore = "\(row.title) | 평점 \(row.rate) | \(row.runtime)분"
        getContent = row.overview
    }
    
}
