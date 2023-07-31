//
//  ViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchContentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchContentLabel.text = "검색 화면"
        searchContentLabel.font = UIFont.systemFont(ofSize: 50)
        title = "검색 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func closeButtonTapped() {
        //아래에서 위로 화면 뜨면 present -> dismiss
        dismiss(animated: true)
        
        //오른쪽에서 왼쪽으로 화면 뜨면 push -> pop
//        navigationController?.popViewController(animated: true)
    }


}

