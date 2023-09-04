//
//  Book.swift
//  BookWarm
//
//  Created by 이은서 on 2023/09/04.
//

import Foundation
import RealmSwift

class BookTable: Object {
//    Book(title: title, author: author, image: image, contents: contents, publisher: publisher)
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var author : String
    @Persisted var image: String?
    @Persisted var contents: String?
    @Persisted var publisher: String
    
    convenience init(title: String, author: String, image: String? = nil, contents: String? = nil, publisher: String) {
        self.init()
        self.title = title
        self.author = author
        self.image = image
        self.contents = contents
        self.publisher = publisher
    }
    
    
}
