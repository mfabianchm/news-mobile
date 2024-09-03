//
//  NewsBodyLabel.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class NewsBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lineBreakMode = .byWordWrapping
        numberOfLines = 4
        translatesAutoresizingMaskIntoConstraints = false
    }

}
