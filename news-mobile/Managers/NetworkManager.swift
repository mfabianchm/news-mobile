//
//  NetworkManager.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import UIKit

class NetworkManager {
    
    static let shared   = NetworkManager()
    private let baseURL = "https://newsapi.org/v2/"
    private let apiKey = "4f87c701006942e4b92f101683311f25"
    let decoder = JSONDecoder()
    
    let cache = NSCache<NSString, UIImage>()
    
    
    private init() {
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    
    func getNews(for topic: String) async throws -> [News] {
        let endpoint = baseURL + "everything?q=\(topic)&language=en&apiKey=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            throw CustomError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CustomError.invalidResponse
        }
        
        do {
            let news = try decoder.decode(Info.self, from: data)
            
            let filteredNews = news.articles.filter { item in
                if item.title == "[Removed]" {
                    return false
                } else {
                    return true

                }
            }
            
            return filteredNews
        } catch {
           throw CustomError.invalidData
        }
    }
    
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image }
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
}

