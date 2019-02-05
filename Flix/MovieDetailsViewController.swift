//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Ariel McCarthy on 2/4/19.
//  Copyright © 2019 Sovreign-Ariel McCarthy. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController
{
    var movie: [String: Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(movie["title"])
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
