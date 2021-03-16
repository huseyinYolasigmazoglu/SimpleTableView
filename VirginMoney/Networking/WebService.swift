//
//  WebService.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation

struct Resource<T> {
    let url: URL?
    let parse: (Data) -> Result<T, NetworkError>
}

protocol IWebservice{
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> ())
}

final class Webservice : IWebservice {
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        //Any possible check to see URL is correct here.
        guard let url = resource.url else{
            completion(.failure(.urlError(description: "Problem with requested URL")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                DispatchQueue.main.async {
                    completion(.failure(.networkError(description:error.localizedDescription )))
                }
                return
            }
            
            if let response = response as? HTTPURLResponse {
                
                print("response.statusCode \(response.statusCode )")
                if response.statusCode != 200 {
                    completion(.failure(.serverError(description:"Server error" )))
                }
                else {
                    
                    if let data = data {
                        DispatchQueue.main.async {
                            completion(resource.parse(data))
                        }
                        return
                    } else {
                        DispatchQueue.main.async {
                            completion(.failure(.networkError(description:"internal Error")))
                        }
                        return
                    }
                }
            }
            
        }.resume()
        
    }
}
