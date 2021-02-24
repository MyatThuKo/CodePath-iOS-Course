//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Myat Thu Ko on 2/23/21.
//

import AlamofireImage
import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet var backdropView: UIImageView!
    @IBOutlet var posterView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var synopsisLabel: UILabel!
    
    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        posterView.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        backdropView.af.setImage(withURL: backdropURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
