//
//  News.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

struct Info: Decodable {
    var articles: [News]
}

struct News: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
