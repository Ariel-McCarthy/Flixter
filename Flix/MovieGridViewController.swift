//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Ariel McCarthy on 2/7/19.
//  Copyright © 2019 Sovreign-Ariel McCarthy. All rights reserved.
//

import UIKit

class MovieGridViewController: UIViewController
{

    @IBOutlet var GridView: UIView!
    
    var movies = [[String: Any]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data
            {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //cast as a dictionary
                self.movies = dataDictionary["results"] as! [[String: Any]]
                
                print(self.movies)
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
