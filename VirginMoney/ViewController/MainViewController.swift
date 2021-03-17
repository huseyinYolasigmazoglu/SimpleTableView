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
    var commentListVM : ListViewModel?
    
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
        
        if commentListVM == nil { //give a default if  value if nil
            commentListVM = CommentListViewModel(service)
        }
        commentListVM?.delegate = self
        tableView.tableFooterView = UIView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            if identifier == Constants.gotoDetailsSegue {
                
                if let destinationViewController = segue.destination as? DetailViewController {
                    
                    if let index = sender as? IndexPath {
                        
                        destinationViewController.detail = commentListVM?.commentIndex(index.row)
                    }
                }
            }
        }
    }
    
}

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentListVM?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as? CommentTableViewCell else {
            
            fatalError("CommentCell not Found")
        }
        
        cell.configure(commentListVM?.commentIndex(indexPath.row) )
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.gotoDetailsSegue, sender: indexPath)
    }
}

extension MainViewController:ListViewModelDelegate {
    
    func refresh() {
        tableView.reloadData()
    }
}



