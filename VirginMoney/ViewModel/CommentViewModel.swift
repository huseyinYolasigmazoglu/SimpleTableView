//
//  CommentViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

protocol CellViewModel {
    
    func name() -> String
    func email() -> String
}


struct CommentViewModel : CellViewModel {
    
    private var comment : Comment
    
    init(_ comment:Comment) {
        
        self.comment = comment
    }
    
    func name() -> String {
        
        return comment.name ?? ""
    }
    
    func email() -> String {
        return comment.email ?? ""
    }
    
}
