//
//  Service.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation


protocol IService {
    
    var baseEndPoint : String { get set }
    func getAllComments(completion: @escaping (Result<[Comment], NetworkError>) -> ())
}

final class Service: IService {
    
    var baseEndPoint : String
    
    private var webService : IWebservice
    
    init(_ service: IWebservice, base:String = EndPoint.testUrl) {
        self.webService = service
        self.baseEndPoint = base
    }
    
    func getAllComments(completion: @escaping (Result<[Comment], NetworkError>) -> ()) {
        
        webService.load(resource()) { (result) in
            
            DispatchQueue.main.async {
                completion(result)
            }
            return
        }
    }
    
    func resource() -> Resource<[Comment]> {
        
        return Resource<[Comment]>( url: URL(string: baseEndPoint))  { data in
            
            guard let result = try? JSONDecoder().decode([Comment].self, from: data) else {
                return .failure(.decodingError(description: "json decode internal error"))
            }
            return .success(result)
        }
    }
}
