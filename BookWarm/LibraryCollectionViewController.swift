//
//  LibraryCollectionViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import RealmSwift

class LibraryCollectionViewController: UICollectionViewController, UICollectionViewDataSourcePrefetching {
   
    let searchBar = UISearchBar()
    var bookList: [Book] = []
    var page = 1
    var isEnd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LibraryListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "LibraryListCollectionViewCell")
        setLayout()
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem?.tintColor = .black
        collectionView.prefetchDataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        
        navigationItem.titleView = searchBar
        bookList = []
        
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        
        let width = UIScreen.main.bounds.width - spacing
        layout.itemSize = CGSize(width: width, height: width / 4)
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryListCollectionViewCell", for: indexPath) as? LibraryListCollectionViewCell else { return UICollectionViewCell() }
        
        let row = bookList[indexPath.row]
        cell.configCell(row: row)
        
        if let imageURL = URL(string: bookList[indexPath.row].image) {
            cell.posterImageView.kf.setImage(with: imageURL)
        }
        
        //좋아요 버튼 누르기
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        cell.likeButton.setTitle("", for: .normal)
        cell.likeButton.tintColor = .white
        
        return cell
    }
    @objc func likeButtonTapped(_ sender: UIButton) {
        bookList[sender.tag].like.toggle()
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
    
    func callRequest(query: String, page: Int) {
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)&page=\(page)&size=17"
        let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.kakao)"]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.isEnd = json["meta"]["is_end"].boolValue
                
                for i in json["documents"].arrayValue {
                    let title = i["title"].stringValue
                    let image = i["thumbnail"].stringValue
                    let contents = i["contents"].stringValue
                    let publisher = i["publisher"].stringValue
                    let price = i["price"].stringValue
                    let authors = i["authors"].arrayValue
                    var author = ""
                    if authors.count == 1 {
                        author += authors[0].stringValue
                    } else {
                        for j in authors {
                            author += "\(j.stringValue) "
                        }
                    }
                    
                    let newBook = Book(title: title, author: author, image: image, contents: contents, publisher: publisher, price: price)
                    
                    let realm = try! Realm()
                    let books = BookTable(title: title, author: author, image: image, contents: contents, publisher: publisher, price: price)
                    
                    try! realm.write {
                        realm.add(books)
                        print("Realm Add Succeed")
                    }
                    
                    
                    self.bookList.append(newBook)
                }
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for i in indexPaths {
            if bookList.count - 1 == i.row && page < 50 && !isEnd {
                page += 1
                callRequest(query: searchBar.text!, page: page)
            }
        }
    }
    
}

extension LibraryCollectionViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        bookList.removeAll()
        page = 1
        callRequest(query: searchBar.text!, page: page)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //서치바 텍스트, 서치리스트 결과 지우기
        bookList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchList.removeAll()
//        for item in list.movie {
//            if item.title.contains(searchBar.text!) {
//                searchList.append(item)
////                print(searchList)
//            }
//        }
//        collectionView.reloadData()
//
//    }
    
}
