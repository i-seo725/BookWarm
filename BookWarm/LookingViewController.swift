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
        layout.itemSize = .init(width: 120, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 10)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
//        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        vc.transitionType = .present
        
        let row = list.movie[indexPath.row]
        vc.getTitle = row.title
        vc.getPosterImage = row.title
        vc.getLikeImage = row.like
        vc.getTitleScore = "\(row.title) | 평점 \(row.rate) | \(row.runtime)분"
        vc.getContent = row.overview
        print(row.title)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
//        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        vc.transitionType = .present
        
        let row = list.movie[indexPath.row]
        vc.getData(row: row)
    }
    
    
    
    
}
