//
//  Model.swift
//  YouTube
//
//  Created by sachin sharma on 12/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import Foundation

struct Model {
    
    func getVideos(){
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //Create a URLSession object
        let session = URLSession.shared
        
        //Get a dataTask from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            //Parsing the data into video objects
        }
        
        //Kick off the task
        dataTask.resume()
    }
    
}
