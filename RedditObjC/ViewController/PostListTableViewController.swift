//
//  PostListTableViewController.swift
//  RedditObjC
//
//  Created by Adam on 08/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    var posts = [AMPost]() {
        didSet {
            posts.forEach { print($0.title) }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setUPUI()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let clearColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 1, alpha: 0.2)
        cell.textLabel?.backgroundColor = clearColor
        cell.detailTextLabel?.backgroundColor = clearColor
    }
}

// MARK: - UISearchBarDelegate Functions
extension PostListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        guard let searchText = searchBar.text else { return }
        guard searchText.isEmpty == false else { return }
        
        AMPostController.fetchPost(forSeachTerm: searchText) { (posts) in
            guard let posts = posts else { return }
            DispatchQueue.main.async {
                self.posts = posts
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
}
extension PostListTableViewController{
    
    // MARK: - UI
    
    func setUPUI() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "background"))
        tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        
        // Make a blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        imageView.clipsToBounds = true
    }
}

