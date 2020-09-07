//
//  ViewController.swift
//  RentCalc
//
//  Created by Admin on 7/30/20.
//  Copyright © 2020 Holmes Org. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SecondViewController: UIViewController {

    var lowValue: String?
    var midValue: String?
    var highValue: String?
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var lowResults: UILabel!
    @IBOutlet weak var midResults: UILabel!
    @IBOutlet weak var highResults: UILabel!
    @IBOutlet weak var customButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lowResults.text = "$\(lowValue!)"
        midResults.text = "$\(midValue!)"
        highResults.text = "$\(highValue!)"
        
        customButton.layer.cornerRadius = 15
        customButton.clipsToBounds = true
        //customButton.backgroundColor = UIColor.red
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    

    @IBAction func resetButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

