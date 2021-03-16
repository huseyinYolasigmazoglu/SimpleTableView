//
//  CommentListViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

struct CommentListViewModel {
    
    private var comments : [Comment]?
    private var commentsViewModel : [CommentViewModel]?
    private var service:IService
    
    init(_ service:IService) {
        
        self.service = service
        comments = fetchData()
        
        if let comments = comments {
            
            commentsViewModel = comments.map { (comment) in
                return CommentViewModel(comment)
            }
        }
    }
    
    private func fetchData() -> [Comment]? {
        
        var allComments : [Comment]?
        service.getAllComments { (result) in
            
            switch result {
            case .success(let comments):
                allComments = comments
            case .failure(_):
                allComments = nil
            }
        }
        return allComments
    }
    
}
