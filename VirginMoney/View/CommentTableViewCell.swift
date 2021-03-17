//
//  CommentTableViewCell.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 17/03/2021.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var email: UILabel!
    @IBOutlet private weak var comment: UILabel!
    
    func configure(_ cell:CellViewModel?)  {
        
        if let cell = cell {
            name.attributedText = cell.name()
            email.attributedText = cell.email()
            comment.attributedText = cell.firstLineOfComment()
        }
    }
    
}
