//
//  LibraryCollectionViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

class LibraryCollectionViewController: UICollectionViewController, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let movieTitleList = ["암살, 명량, 광해, 부산행, 아바타, 어벤져스엔드게임, 해운대, 7번방의선물, 겨울왕국2"]
    var searchList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LibraryListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "LibraryListCollectionViewCell")
        setLayout()
        title = "은서의 책장"
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        
        navigationItem.titleView = searchBar
        searchList = []
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        
        let width = UIScreen.main.bounds.width - spacing * 3
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryListCollectionViewCell", for: indexPath) as? LibraryListCollectionViewCell else { return UICollectionViewCell() }
        
//        for i in searchList {
//            if i == list.movie
//        }
        
        
        
        let row = list.movie[indexPath.row]
        cell.configCell(row: row)
        
        //좋아요 버튼 누르기
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        cell.likeButton.setTitle("", for: .normal)
        cell.likeButton.tintColor = .white
        
        return cell
    }
    
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        list.movie[sender.tag].like.toggle()
        collectionView.reloadData()
    }
    
    
    @IBAction func searchBarButtonTapped(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return }
        
        //제목 바 담기
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        //푸시는 네비게이션 컨트롤러 안됨
//        let nav = UINavigationController(rootViewController: vc)
        
        navigationController?.pushViewController(vc, animated: true)
        
        let row = list.movie[indexPath.row]
        vc.getData(row: row)
//        vc.getTitle = row.title
//        vc.getPosterImage = row.title
//        vc.getLikeImage = row.like
//        vc.getTitleScore = "\(row.title) | 평점 \(row.rate) | \(row.runtime)분"
//        vc.getContent = row.overview
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        for item in movieTitleList {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //서치바 텍스트, 서치리스트 결과 지우기
        searchList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        for item in movieTitleList {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        collectionView.reloadData()

    }
    
    
}
