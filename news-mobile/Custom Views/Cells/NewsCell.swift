//
//  NewsCell.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class NewsCell: UITableViewCell {

    static let reuseID  = "NewsCell"
    let newsImageView = NewsImageView(frame: .zero)
    let newsTitleLabel = NewsTitleLabel(textAlignment: .left, fontSize: 16)
    let newsDecriptionLabel = NewsBodyLabel(textAlignment: .left)
    let detailsButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(news: News) {
        newsTitleLabel.text = news.title
        newsDecriptionLabel.text = news.description
//        print(news.urlToImage)
//        
//        if(news.urlToImage == nil) {
//            return
//        } else {
//            newsImageView.downloadImage(fromURL: news.urlToImage!)
//        }
      
    }
    
    
    private func configure() {
        addSubviews(newsImageView, newsTitleLabel, newsDecriptionLabel, detailsButton)
        let padding: CGFloat = 12
        
        detailsButton.setTitle("See more", for: .normal)
        detailsButton.setTitleColor(.label, for: .normal)
        detailsButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        detailsButton.semanticContentAttribute = .forceRightToLeft
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            newsImageView.heightAnchor.constraint(equalToConstant: 130),
            newsImageView.widthAnchor.constraint(equalToConstant: 130),
            
            newsTitleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            newsTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            newsDecriptionLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 5),
            newsDecriptionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            newsDecriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            detailsButton.topAnchor.constraint(equalTo: newsDecriptionLabel.bottomAnchor, constant: 5),
            detailsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            detailsButton.heightAnchor.constraint(equalToConstant: 30),
            detailsButton.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }

}
