//
//  CommentViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

protocol CellViewModel {
    
    func name() -> NSAttributedString
    func email() -> NSAttributedString
    func fullComment() -> NSAttributedString
    func firstLineOfComment() -> NSAttributedString
}


final class CommentViewModel : CellViewModel {
    
    private var comment : Comment
    
    init(_ comment:Comment) {
        
        self.comment = comment
    }
    
    func name() -> NSAttributedString {
        
        let name = "NAME:"
        return "\(name) \(comment.name ?? "")".withBoldText(text: name)
    }
    
    func email() -> NSAttributedString {
        
        let email = "EMAIL:"
        return "\(email) \(comment.email ?? "")".withBoldText(text: email)
        
    }
    func fullComment() -> NSAttributedString {
        
        let com = "COMMENT:"
        return "\(com) \(comment.comment ?? "")".withBoldText(text: com)
    }
    func firstLineOfComment() -> NSAttributedString {
        
        let com = "COMMENT:"
        return "\(com) \(comment.comment?.stringBefore("\n") ?? "")".withBoldText(text: com)
    }
}
