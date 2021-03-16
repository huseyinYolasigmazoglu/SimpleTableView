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

    
    var webService :  IWebservice {
        set{
            _webService = newValue
        }
        get{
            if let service = _webService {
                return service
            }else{
                return Webservice()
            }
        }
    }
    
    var service : IService {
        
        set{
            _service = newValue
        }
        get{
            if  let service = _service {
                return service
            }else{
                return Service(webService)
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
    }
    
}

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "1"
        
        return cell
    }
}



