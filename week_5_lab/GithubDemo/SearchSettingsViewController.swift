//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Jasmine Farrell on 2/25/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    @IBAction func goBack(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func slideBar(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
