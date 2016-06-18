//
//  NewsDetailsViewController.swift
//  Nobala
//
//  Created by Ali Mohamed Kabel on 6/18/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsDetailsTitle: UILabel!
    @IBOutlet weak var newsDetailsLable: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    var news:News = News()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsDetailsTitle.text = self.news._details
        self.newsDetailsLable.text = self.news._title
        self.newsDetailsLable.sizeToFit()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
//        self.navigationController?.navigationItem.leftBarButtonItem(UIBarButtonItem: .Add, target: self, action: #selector(backButtonClicked))
        // Do any additional setup after loading the view.
    }

    func backButtonClicked()
    {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
