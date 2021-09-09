//
//  InformationViewController.swift
//  Resume App
//
//  Created by Julia on 06.09.2021.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet var pushMeButton: UIButton!
    
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var imagine: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.isHidden = true
        imagine.isHidden = true
        
        pushMeButton.layer.cornerRadius = 15
    }
    
    @IBAction func pushTheButton() {
        showAlert(with: "Attention!", and: "Very serious Person.")
        textLabel.isHidden = false
        imagine.isHidden = false
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

