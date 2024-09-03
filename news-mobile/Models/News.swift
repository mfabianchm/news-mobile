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

struct News: Decodable, Hashable, Identifiable {
    let id = UUID()
    
    private enum CodingKeys : String, CodingKey { case
        author, title, description, url, urlToImage, publishedAt, content
    }
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
