//
//  Comment.swift
//  Product Hunt Tutorial
//
//  Created by Henry Calderon on 4/17/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation

struct Comment: Decodable {
 let id: Int
 let body: String
}

struct CommentApiResponse: Decodable {
   let comments: [Comment]
}
