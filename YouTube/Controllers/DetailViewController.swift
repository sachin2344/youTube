//
//  DetailViewController.swift
//  YouTube
//
//  Created by sachin sharma on 14/07/20.
//  Copyright © 2020 Sachin Sharma. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Cleat the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //check if there is a video
        guard video != nil else{
            return
        }
        //Create the embeded url
        
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //Load it into webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        //Set the title
        titleLabel.text = video?.title
        
        //Set the date
        let df = DateFormatter()
               df.dateFormat = "EEEE, MMM d, yyyy"
               dateLabel.text = df.string(from: video!.published)
               
        //Set the description
         textView.text = video?.description
    }
    

}
