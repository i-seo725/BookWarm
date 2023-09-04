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
    @IBOutlet var memoTextView: UITextView!
    
    var transitionType: transition = .push
    var selectedBook: BookTable?
    
    var editTextView: String = ""
    let placeholderText = "내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.delegate = self
        memoTextView.text = placeholderText
        memoTextView.textColor = .lightGray
        setView()
        //        setTransition()
        // 이건 모달 방식일 때 하는 설정인듯!
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(backButtonTapped))
        //        navigationItem.
        //        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
    }
    
    func setView() {
        guard let selectedBook else { return }
        title = selectedBook.title
        titleScoreLabel.text = selectedBook.title
        contentLabel.numberOfLines = 12
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        backView.backgroundColor = .systemGray5
        
        guard let contents = selectedBook.contents, let imageURL = selectedBook.image, let url = URL(string: imageURL) else { return }
        contentLabel.text = contents
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url)
            
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(data: data)
            }
        }
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UITextViewDelegate {
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
