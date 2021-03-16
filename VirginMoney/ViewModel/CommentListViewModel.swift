//
//  CommentListViewModel.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

protocol CommentListViewModelDelegate : class {
    func refresh()
}

class CommentListViewModel : CommentListViewModelDelegate {
    
    private var comments : [Comment]?
    private var commentsViewModel : [CommentViewModel]?
    private var service:IService
    
    weak var delegate:CommentListViewModelDelegate?
    
    init(_ service:IService) {
        
        self.service = service
        fetchData()
        
    }
    
    func refresh()  {
        delegate?.refresh()
    }
    
    private func fetchData()  {
        
        self.service.getAllComments { [weak self] result in
            
            print(result)
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
    
    func numberOfComments() -> Int{
        
        return commentsViewModel?.count ?? 0
    }
    
    func commentIndex(_ index:Int) -> CommentViewModel? {
        
        return commentsViewModel?[index]
    }
}
