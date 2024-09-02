//
//  HomeVC.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
    }
    
    func getNews() {
        Task {
            do {
                let news = try await NetworkManager.shared.getNews(for: "apple")
                print(news)
            } catch {
                if let customError = error as? CustomError {
                    print(customError)
                } else {
                    print("default error")
                }
            }
            
        }
    }
    

   

}
