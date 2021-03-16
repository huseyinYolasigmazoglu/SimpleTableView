//
//  CommentViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

struct CommentViewModel {
    
    private var comment : Comment
    
    init(_ comment:Comment) {
        
        self.comment = comment
    }
    
    func name() -> String {
        
        return comment.name ?? ""
    }
}
