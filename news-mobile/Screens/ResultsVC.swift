//
//  ResultsVC.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 03/09/24.
//

import UIKit

class ResultsVC: DataLoadingVC {

    let tableView = UITableView()
    var news: [News] = []
    
    var newsToSearch: String?

    init(newsToSearch: String) {
        super.init(nibName: nil, bundle: nil)
        self.newsToSearch = newsToSearch
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getNews()
    }
    
    
    func configureViewController() {
        view.backgroundColor    = .systemBackground
        title                   = "Results"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 230
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
    }
    
    func getNews() {
        showLoadingView()
        
        Task {
            do {
                let news = try await NetworkManager.shared.getNews(for: newsToSearch!)
                updateUI(with: news)
                dismissLoadingView()
            } catch {
                if let customError = error as? CustomError {
                    print(customError)
                } else {
                    print("default error")
                }
                
                dismissLoadingView()
            }
            
        }
    }
        
    func updateUI(with news: [News]) {
        if news.isEmpty {
            let message = "Sorry no news found about this topic."
            DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
            return
        } else  {
            self.news = news
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension ResultsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID) as! NewsCell
        let news = news[indexPath.row]
        cell.set(news: news)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = news[indexPath.row]
        let detailsVC = DetailsVC(news: news)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
}
