//
//  DetailViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit
import RealmSwift

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
    let repo = Repository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.delegate = self
        memoTextView.text = placeholderText
        memoTextView.textColor = .lightGray
        setView()
        let doneButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
        let deleteButton = UIBarButtonItem(title: "삭제", style: .plain, target: self, action: #selector(deleteButtonClicked))
        navigationItem.rightBarButtonItems = [doneButton, deleteButton]
        
        
        //        setTransition()
        // 이건 모달 방식일 때 하는 설정인듯!
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(backButtonTapped))
        //        navigationItem.
        //        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
    }
    
    @objc func doneButtonClicked() {
        guard let selectedBook else { return }
        repo.update(id: selectedBook._id, memo: memoTextView.text)
        view.endEditing(true)
    }
    @objc func deleteButtonClicked() {
        guard let selectedBook else { return }
        
        navigationController?.popViewController(animated: true)
        removeImageFromDocument(fileName: "\(selectedBook._id).jpg")
        repo.delete(data: selectedBook)
        
    }
    
    func setView() {
        guard let selectedBook else { return }
        title = selectedBook.title
        titleScoreLabel.text = selectedBook.title
        contentLabel.numberOfLines = 12
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        backView.backgroundColor = .systemGray5
        posterImageView.image = loadImageFromDocument(fileName: "\(selectedBook._id).jpg")
        
        if let memo = selectedBook.memo {
            memoTextView.text = memo
        }
        
        guard let contents = selectedBook.contents else { return }
        contentLabel.text = contents
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
