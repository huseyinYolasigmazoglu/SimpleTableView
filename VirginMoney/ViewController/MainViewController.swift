//
//  ViewController.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import UIKit

final class MainViewController: UIViewController,UITableViewDelegate {
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var _service : IService?
    private var _webService :  IWebservice?
    private var commentListVM : CommentListViewModel?
    
    //below property can be set from outside class, to help Dependency Injection
    var webService :  IWebservice {
        set{
            _webService = newValue
        }
        get{
            if let service = _webService {
                return service
            }else{
                return Webservice() //if nil default value
            }
        }
    }
    
    //below property can be set from outside class, to help Dependency Injection
    var service : IService {
        
        set{
            _service = newValue
        }
        get{
            if  let service = _service {
                return service
            }else{
                return Service(webService) //if nil default value
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    func configureViewController()  {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        commentListVM = CommentListViewModel(service)
        commentListVM?.delegate = self
    }
    
}

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentListVM?.numberOfComments() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = commentListVM?.commentIndex(indexPath.row)?.name()
        
        return cell
    }
}

extension MainViewController:CommentListViewModelDelegate {
    
    func refresh() {
        
        tableView.reloadData()
    }
    
}



