//
//  LookingViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/08/02.
//

import UIKit

class LookingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
      
    @IBOutlet var collectionViewTitle: UILabel!
    @IBOutlet var recentCollectionView: UICollectionView!
    @IBOutlet var tableViewTitle: UILabel!
    @IBOutlet var popularTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(systemName: "star.fill")
        tabBarItem.title = "Tab bar1"
        navigationItem.title = "둘러보기"
        
        collectionViewTitle.text = "최근 본 작품"
        tableViewTitle.text = "요즘 인기 작품"
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
}
