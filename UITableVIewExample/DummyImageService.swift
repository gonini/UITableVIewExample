//
//  ImageService.swift
//  UITableVIewExample
//
//  Created by 장공의 on 28/05/2019.
//  Copyright © 2019 gonini. All rights reserved.
//

import Foundation

struct DummyImageService {
    private let dummuImageLimit = 300
    
    func fecth(startIndex: Int, count: Int, _ completionHandler: ([URL]) -> Void ) {
        var images = [URL]()
        
        for i in startIndex..<count {
            images.append(URL(string: "https://picsum.photos/\(200 + i)/\(300 + i)")!)
        }
        
        completionHandler(images)
    }
}
