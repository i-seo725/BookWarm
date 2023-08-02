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
    @IBOutlet var popularTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "둘러보기"
        
        collectionViewTitle.text = "최근 본 작품"
        
        recentCollectionView.dataSource = self
        recentCollectionView.delegate = self
        popularTableView.dataSource = self
        popularTableView.delegate = self
        
        popularTableView.rowHeight = 130
        
        configCollectionViewLayout()
        
    }

    func configCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 120, height: 18018)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        recentCollectionView.collectionViewLayout = layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as? RecentCollectionViewCell else { print("오류")
            return UICollectionViewCell() }
        
        let item = list.movie[indexPath.item]
        cell.setRecentPosterImageView(item: item)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell") as! PopularTableViewCell
        let row = list.movie[indexPath.row]
        cell.configPopularMovieTableView(row: row)
        
        return cell
    }
    
    
    
    
}
