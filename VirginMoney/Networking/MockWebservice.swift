//
//  MockWebservice.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 17/03/2021.
//

import Foundation

final class MockWebservice : IWebservice {
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        let string = """
        [
        {
        "postId": 1,
        "id": 1,
        "name": "id labore ex et quam laborum",
        "email": "Eliseo@gardner.biz",
        "body": "FIRST_LINE\\nYYY"
        }
        ]
        """
        
        let data = string.data(using: .utf8)!
        
        DispatchQueue.main.async {
            completion(resource.parse(data))
        }
    }
}


