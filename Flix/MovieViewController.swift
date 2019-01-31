//
//  MovieViewController.swift
//  Flix
//
//  Created by Ariel McCarthy on 1/31/19.
//  Copyright © 2019 Sovreign-Ariel McCarthy. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var movies = [[String: Any]]()
    
    @IBOutlet weak var MovieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieTableView.dataSource = self
        MovieTableView.delegate = self

        // Do any additional setup after loading the view.
        print("hello")
        
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //cast as a dictionary
                self.movies = dataDictionary["results"] as! [[String: Any]]
                
                // reload table view
                self.MovieTableView.reloadData()
                
                print(dataDictionary)
                
                // TODO: Get the array of movies
                
                
                // TODO: Store the movies in a property to use elsewhere
                
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        
        cell.textLabel!.text = title
        
        return cell
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
