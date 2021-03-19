//
//  ViewController.swift
//  Parstagram
//
//  Created by Myat Thu Ko on 3/17/21.
//

import AlamofireImage
import Parse
import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var feedTableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 25
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                print("Posts query succeed")
                
                self.posts = posts!
                self.feedTableView.reloadData()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.authorLabel.text = user.username
        cell.captionLabel.text = post["caption"] as! String
        
        let imageFile = post["photo"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        return cell
    }

}

