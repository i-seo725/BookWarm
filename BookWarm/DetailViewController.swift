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

class DetailViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var titleScoreLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var memoTextView: UITextView!
    
    var transitionType: transition = .push
    var getTitle: String = "빈 제목"
    var getPosterImage: String = "빈 영화 포스터"
    var getLikeImage: Bool = true
    var getTitleScore: String = "빈 정보"
    var getContent: String = "빈 내용"
    
    var editTextView: String = ""
    let placeholderText = "내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = getTitle
        posterImageView.image = UIImage(named: getPosterImage)
        
        let like = getLikeImage == true ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeImageView.image = like
        likeImageView.tintColor = .systemRed
        titleScoreLabel.text = getTitleScore
        contentLabel.text = getContent
        contentLabel.numberOfLines = 10
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        
        backView.backgroundColor = .systemGray5
        
        memoTextView.delegate = self
        memoTextView.text = placeholderText
        memoTextView.textColor = .lightGray

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
 
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoTextView.text == placeholderText {
            memoTextView.text = nil
            memoTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if memoTextView.text.isEmpty {
            memoTextView.text = placeholderText
            memoTextView.textColor = .lightGray
        }
    }

}
