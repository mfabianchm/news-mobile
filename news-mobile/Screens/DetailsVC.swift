//
//  DetailsVC.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let titleLabel = NewsTitleLabel(textAlignment: .left, fontSize: 26)
    let descriptionLabel = NewsBodyLabel(textAlignment: .left)
    let imageView = NewsImageView(frame: .zero)
    let authorNameLabel = UILabel()
    let dateLabel = UILabel()
    let contentLabel = NewsBodyLabel(textAlignment: .left)
    let linkButton = UIButton(type: .roundedRect)
    
    var news: News!
    var itemViews: [UIView] = []
    
    init(news: News) {
        super.init(nibName: nil, bundle: nil)
        self.news = news
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        configureLinkButton()
        layoutUI()
        updateData()
    }
    
    @objc func goToLink() {
        let link = news.url ?? "www.google.com"
        
        let url = URL(string: link)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)

            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                 print("Open url : \(success)")
            })
        }
    }
    
    func configureLinkButton() {
        linkButton.setTitle("Read more...", for: .normal)
        linkButton.addTarget(self, action: #selector(goToLink), for: .touchUpInside)
        linkButton.backgroundColor = .systemBlue
        linkButton.setTitleColor(.white, for: .normal)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    func updateData() {
        if let dateString = news.publishedAt {
            dateLabel.text = String(dateString.prefix(10))
        }
        
        if let contentString = news.content {
            contentLabel.text = String(contentString.prefix(200))
            contentLabel.numberOfLines = 0
        }
        
        titleLabel.text = news.title
        authorNameLabel.text = news.author
        descriptionLabel.text = news.description
        
        guard let imageURL = news.urlToImage else {
            return
        }
        
        imageView.downloadImage(fromURL: imageURL)
        
    }
    
    func layoutUI() {
        let padding: CGFloat    = 20
        
        itemViews = [titleLabel, descriptionLabel, imageView, authorNameLabel, dateLabel, linkButton, contentLabel]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            authorNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),

            dateLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 5),

            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            
            contentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            
            linkButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    @objc func dismssVC() {
        dismiss(animated: true)
    }

}
