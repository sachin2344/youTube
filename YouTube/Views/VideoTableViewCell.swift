//
//  videoTableViewCell.swift
//  YouTube
//
//  Created by sachin sharma on 14/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else{
            return
        }
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        
        guard video!.thumbnail != "" else{
            return
        }
        
        //Check the cache before downloading data
        if let cachedData = CacheManger.getVideoCache(self.video!.thumbnail){
            
            //Set the image
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Image download task
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, reponse, error) in
            if error == nil && data != nil{
                
                //Save the image Data into Cache
                CacheManger.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail{
                    //VideoCell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                //Set the image view
                
                DispatchQueue.main.async {
                     self.thumbnailImageView?.image = image
                }
               
            }
        }
        dataTask.resume()
    }
}
