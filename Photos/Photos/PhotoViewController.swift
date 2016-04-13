//
//  PhotoViewController.swift
//  Photos
//
//  Created by Ruijing Li on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photo: Photo!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var heart: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
    }
    
    func setup(){
        loadImageForCell(self.photo, imageView: photoImage)
        usernameLabel.text = "Username: " + photo.username
        likeCountLabel.text = "Likes: " + String(photo.likes)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateLabel.text = "Date: \(dateFormatter.stringFromDate(photo.date))"
        heart = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likePhoto(sender: UIButton) {
        if heart == true {
            photo.likes = photo.likes + 1
            likeCountLabel.text = "Likes: " + String(photo.likes)
            heart = false
            sender.setBackgroundImage(UIImage(named: "smily"), forState: UIControlState.Normal)
        }
    }
   
    
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                let img = UIImage(data: data!)
                imageView.image = img
            }
        })
        task.resume()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
