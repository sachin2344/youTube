//
//  Model.swift
//  YouTube
//
//  Created by sachin sharma on 12/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videoFetched(_ videos: [Video])
}

class Model {
    
    var delegate:  ModelDelegate?
    
    func getVideos(){
        
        //Create a URL object
        let url = URL(string: Constants.API_URL)
        print("url is",url)
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
            do{
                //Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try  decoder.decode(Response.self, from: data!)
                if response.items != nil {
                    DispatchQueue.main.async {
                        self.delegate?.videoFetched(response.items!)
                    }
                }
                dump(response)
                           
            }catch{
                print("error in parsing",error)
            }
           
        }
        
        //Kick off the task
        dataTask.resume()
    }
    
   
    
}
