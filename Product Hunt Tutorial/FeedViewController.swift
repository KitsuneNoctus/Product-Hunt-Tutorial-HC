//
//  FeedViewController.swift
//  Product Hunt Tutorial
//
//  Created by Henry Calderon on 4/16/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

//MARK: Feed View Controller
class FeedViewController: UIViewController {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    // Array of Post objects to simulate real data coming in
    // Make sure each property that we're assigning to a UI element has a value for each mock Post.
    var posts: [Post] = [] {
       didSet {
           feedTableView.reloadData()
       }
    }

    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedTableView.dataSource = self
        feedTableView.delegate = self
        updateFeed()
    }
    
    func updateFeed() {
        // call our network manager's getPosts method to update our feed with posts
        networkManager.getPosts() { result in
            self.posts = result
        }
    }

}

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
   /// Determines how many cells will be shown on the table view.
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
   }

   /// Creates and configures each cell.
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // dequeue and return an available cell, instead of creating a new cell
       let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
    
        // Grab a post from our "data"
        let post = posts[indexPath.row]
        // Assign a post to that cell
        cell.post = post

       return cell
  }
}


// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
  // Code to handle cell events goes here...
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      // provide a fixed size
      return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let post = posts[indexPath.row]
        // Get the storyboard
         let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Get the commentsView from the storyboard
         guard let commentsView = storyboard.instantiateViewController(withIdentifier: "commentsView") as? CommentsViewController else {
           return
         }
         // add mock comments
         commentsView.comments = ["Blah blah blah!", "Good app.", "Wow."]
         navigationController?.pushViewController(commentsView, animated: true)
    }
}

