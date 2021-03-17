//
//  CommentTableViewCell.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 17/03/2021.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

 
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var comment: UILabel!
    
    func configure(_ cell:CellViewModel?)  {
        
        if let cell = cell {
            name.text = cell.name()
            email.text = cell.email()
            comment.text = cell.theComment()
        }
    }
        
}
