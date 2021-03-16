//
//  Error.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation


enum NetworkError: Error {
    
    case decodingError(description: String?)
    case networkError(description: String?)
    case urlError(description: String?)
    case serverError(description: String?)
    
    func geterror() -> String {
        switch self {
        case .decodingError(let description):
            return description ?? ""
        case .networkError(let description):
            return  description ?? ""
        case .urlError(let description):
            return  description ?? ""
        case .serverError(let description):
            return  description ?? ""
        }
    }
}
