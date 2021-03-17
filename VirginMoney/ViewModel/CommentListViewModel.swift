//
//  CommentListViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

protocol ListViewModelDelegate : class {
    func refresh()
}

protocol ListViewModel : ListViewModelDelegate {
    var service:IService { get set }
    var delegate:ListViewModelDelegate? { get set }
    func numberOfItems() -> Int
    func commentIndex(_ index:Int) -> CellViewModel?
}

class CommentListViewModel : ListViewModel {
    
    private var commentsViewModel : [CommentViewModel]?
    var service:IService
    
    weak var delegate:ListViewModelDelegate?
    
    init(_ service:IService) {
        
        self.service = service
        fetchData()
    }
    
    func refresh()  {
        delegate?.refresh()
    }
    
    private func fetchData()  {
        
        self.service.getAllComments { [weak self] result in
            
            switch result {
            case .success(let comment):
                self?.initViewModelList(comment)
                self?.refresh()
            case .failure(_):
                print("Error")
            }
        }
    }
    private func initViewModelList(_ comments:[Comment]){
        
        commentsViewModel = comments.map { (comment) in
            return CommentViewModel(comment)
        }
    }
    
    func numberOfItems() -> Int {
        
        return commentsViewModel?.count ?? 0
    }
    
    func commentIndex(_ index:Int) -> CellViewModel? {
        
        return commentsViewModel?[index]
    }
}
