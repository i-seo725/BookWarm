//
//  bookStruct.swift
//  BookWarm
//
//  Created by 이은서 on 2023/08/09.
//

import Foundation

struct Book {
    let title: String
    let author: String
    let image: String
    let contents: String
    let publisher: String
    let price: String
//    let date: String
    
    var like = false
    let colorR: CGFloat = CGFloat.random(in: 0...1)
    let colorG: CGFloat = CGFloat.random(in: 0...1)
    let colorB: CGFloat = CGFloat.random(in: 0...1)
}
