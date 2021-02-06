//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [[String:Any?]] = []

    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 300
        
        getAPIData()
    }
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
//            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData() // reload data!
        }
    }
    
    // Protocol Stubs
    
    // numberOfRowInSection tells the table view how many rows, or cells in this case, to create.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("RestaurantsArray Count \(restaurantsArray.count)")
        return restaurantsArray.count
    }
    
    // What type of cell are we configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        // Set Label to the restaurant name for each cell
        cell.label.text = restaurant["name"] as? String ?? ""
        
        cell.phoneNumberLabel.text = restaurant["display_phone"] as? String ?? ""
        
        // Set Image of restaurant
        // 1. Get the image url string from the restaurant dictionary
        if let imageURLString = restaurant["image_url"] as? String {
            // 2. Get the convert url string -> url
            let imageURL = URL(string: imageURLString)
            // 3. Set image using the image url with AlamofireImage
            cell.restaurantImage.af.setImage(withURL: imageURL!)
        }
        
        let rating = restaurant["rating"] as? Float ?? 0.0
        cell.starRatingImage.image = UIImage(named: String(rating))
        
        let review_count = restaurant["review_count"] as? Int ?? 0
        cell.reviewCountLabel.text = String(review_count)
        
        return cell
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


