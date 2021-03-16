//
//  Comments.swift
//  VirginMoney
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import Foundation


//Create a tableview showing the following items:
//
//"name":
//"email":
//First line of the comment only, line break mode by truncating tail
//
//When the user taps on the cell the app opens a new view controller shows the full comment body
//
//Preferred Architecture Pattern MVVM
//Please add unit test cases
//https://jsonplaceholder.typicode.com/posts/1/comments


struct Comment: Codable {
    
    let postId : Int?
    let id : Int?
    let name:String?
    let email:String?
    let comment:String?
    
    enum CodingKeys: String, CodingKey {
        case postId,id,name,email,comment = "body"
    }
}


