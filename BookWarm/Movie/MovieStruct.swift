//
//  MovieStruct.swift
//  BookWarm
//
//  Created by 이은서 on 2023/07/31.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    let rate: Double
    var like: Bool
    let colorR: CGFloat = CGFloat.random(in: 0...1)
    let colorG: CGFloat = CGFloat.random(in: 0...1)
    let colorB: CGFloat = CGFloat.random(in: 0...1)
}
