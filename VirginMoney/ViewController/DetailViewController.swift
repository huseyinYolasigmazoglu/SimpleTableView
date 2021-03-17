//
//  DenemeViewController.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 17/03/2021.
//

import UIKit

final class DetailViewController: UIViewController {
    

    @IBOutlet private weak var detailComment: UILabel!
    
    var detail : CellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let detail = detail {
            detailComment.attributedText = detail.fullComment()
        }
    }
    
}
