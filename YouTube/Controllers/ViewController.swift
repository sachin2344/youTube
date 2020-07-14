//
//  ViewController.swift
//  YouTube
//
//  Created by sachin sharma on 08/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate, ModelDelegate{
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        
        model.getVideos() 
        
    }
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        print("title is",title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //Confirm a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get a reference to the video tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Get a reference to the detailView controller
        let detailVC = segue.destination as! DetailViewController
        
        //Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK:- ModelDelegate Methods
    func videoFetched(_ videos: [Video]) {
        self.videos = videos
        self.tableView.reloadData()
    }
    
}

