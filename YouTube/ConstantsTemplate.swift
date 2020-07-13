//
//  ConstantsTemplate.swift
//  YouTube
//
//  Created by sachin sharma on 12/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

//Create Your own Api keys

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = " 'https:www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "videoCell"
}

