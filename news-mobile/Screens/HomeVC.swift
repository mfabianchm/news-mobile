//
//  HomeVC.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class HomeVC: DataLoadingVC {
    
    enum Section { case main }
    
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, News>!
    
//    let tableView = UITableView()
    var news: [News] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        getNews()
        configureDataSource()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "World News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        
        tableView = UITableView()
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 230
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, News>(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
            cell.set(news: item)
            return cell
        }
    }
        
        func getNews() {
            showLoadingView()
            
            Task {
                do {
                    let news = try await NetworkManager.shared.getNews(for: "apple")
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
        
        func updateData(on news: [News]) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, News>()
            snapshot.appendSections([.main])
            snapshot.appendItems(news)
            DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        }
        
        func updateUI(with news: [News]) {
            self.news.append(contentsOf: news)
            
            if self.news.isEmpty {
                return
            }
            self.updateData(on: self.news)
        }
        
        
    }
    
    


extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = news[indexPath.row]
        let nextVC = DetailsVC(news: news)
    
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
