//
//  LookingViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/08/02.
//

import UIKit
import RealmSwift

class LookingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
      
    @IBOutlet var collectionViewTitle: UILabel!
    @IBOutlet var recentCollectionView: UICollectionView!
    @IBOutlet var popularTableView: UITableView!
    
    var books: Results<BookTable>!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        books = realm.objects(BookTable.self)
        
        
        navigationItem.title = "둘러보기"
        collectionViewTitle.text = "최근 본 작품"
        
        recentCollectionView.dataSource = self
        recentCollectionView.delegate = self
        popularTableView.dataSource = self
        popularTableView.delegate = self
        
        popularTableView.rowHeight = 130
        
        configCollectionViewLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recentCollectionView.reloadData()
        popularTableView.reloadData()
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
        if books.count > 15 {
            return 15
        } else {
            return books.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentCollectionViewCell", for: indexPath) as? RecentCollectionViewCell else { print("오류")
            return UICollectionViewCell() }
        
        let item = books[indexPath.item]
        cell.RecentPosterImageView.image = loadImageFromDocument(fileName: "\(item._id).jpg")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.selectedBook = books[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if books.count > 15 {
            return 15
        } else {
            return books.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell") as! PopularTableViewCell
        let row = books[indexPath.row]
        cell.configPopularMovieTableView(row: row)
        cell.popularMoviePosterImageView.image = loadImageFromDocument(fileName: "\(row._id).jpg")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
//        vc.modalPresentationStyle = .fullScreen
        vc.selectedBook = books[indexPath.row]
        present(vc, animated: true)
        vc.transitionType = .present
    }
    
    
    
    
    
    
}
