//
//  Video.swift
//  YouTube
//
//  Created by sachin sharma on 12/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
     
    enum Codingkeys: String , CodingKey{
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
         
    }
    
    init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        
        let snippetContainor = try container.nestedContainer(keyedBy: Codingkeys.self, forKey: .snippet)
        
        //Parse title, description, published
        self.title = try snippetContainor.decode(String.self, forKey: .title)
        self.description = try snippetContainor.decode(String.self, forKey: .description)
        self.published = try snippetContainor.decode(Date.self, forKey: .published)
        
        
        let thumbnailContainer = try snippetContainor.nestedContainer(keyedBy: Codingkeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: Codingkeys.self, forKey: .high)
        
        //parse url
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourseIdContainer = try snippetContainor.nestedContainer(keyedBy: Codingkeys.self, forKey: .resourceId)
        
        //parse videoId
        self.videoId = try resourseIdContainer.decode(String.self, forKey: .videoId)
        
        
    }
}
