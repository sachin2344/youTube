//
//  CacheManager.swift
//  YouTube
//
//  Created by sachin sharma on 14/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import Foundation

class CacheManger {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?){
        
        //Store the image data and use the url as key
        cache[url] = data
        
    }
    static func getVideoCache(_ url: String) -> Data?{
     
        //Try to get the data from the specified url
        return cache[url]
        
    }
}
