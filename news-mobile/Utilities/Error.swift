//
//  Error.swift
//  news-mobile
//
//  Created by Marcos Fabian Chong Megchun on 02/09/24.
//

import Foundation

enum CustomError: String, Error {
    case invalidURL    = "Invalid URL. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData   = "There was an error decoding data."
}
