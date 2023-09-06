//
//  Book.swift
//  BookWarm
//
//  Created by 이은서 on 2023/09/04.
//

import Foundation
import RealmSwift

final class BookTable: Object {
//    Book(title: title, author: author, image: image, contents: contents, publisher: publisher)
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var author : String
    @Persisted var image: String?
    @Persisted var contents: String?
    @Persisted var publisher: String
    @Persisted var price: String
    @Persisted var memo: String?
    @Persisted var love: Bool
    @Persisted var status: String
    
    convenience init(title: String, author: String, image: String? = nil, contents: String? = nil, publisher: String, price: String) {
        self.init()
        self.title = title
        self.author = author
        self.image = image
        self.contents = contents
        self.publisher = publisher
        self.price = price
    }
    
    
}
