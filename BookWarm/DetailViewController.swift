//
//  DetailViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailLabel: UILabel!
    var getTitle: String = "빈 제목"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = getTitle
        detailLabel.text = "상세 화면"
        detailLabel.font = UIFont.systemFont(ofSize: 50)
        
        // 이건 모달 방식일 때 하는 설정인듯!
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(backButtonTapped))
//        navigationItem.
//        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    

}
