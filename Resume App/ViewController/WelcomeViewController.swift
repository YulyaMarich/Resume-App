//
//  WelcomeViewController.swift
//  Resume App
//
//  Created by Julia on 06.09.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var welcome: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = welcome
        
        logOutButton.layer.cornerRadius = 15
    }
    
    @IBAction func pressLogOut() {
    }
}
