//
//  ViewController.swift
//  week1-2
//
//  Created by bakae on 8/29/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var didTabBotton: UIButton!
    
    let counting = Counting()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapBotton(_ sender: Any) {
        counting.addCount()
        countLabel.text = "\(counting.count)"
        
        
        
    }
    

}

