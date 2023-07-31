//
//  LibraryCollectionViewController.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import UIKit

class LibraryCollectionViewController: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LibraryListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "LibraryListCollectionViewCell")
        setLayout()
        title = "은서의 책장"
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem?.tintColor = .black
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
        return list.movie.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryListCollectionViewCell", for: indexPath) as? LibraryListCollectionViewCell else { return UICollectionViewCell() }
        
        let row = list.movie[indexPath.row]
        cell.configCell(row: row)
        
        return cell
    }
    
    
}
