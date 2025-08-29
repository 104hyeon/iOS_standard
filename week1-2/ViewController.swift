//
//  ViewController.swift
//  week1-2
//
//  Created by bakae on 8/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var countButton: UIButton!
    
    let counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func excuteCounter(_ sender: Any) {
        counter.addCount()
        countLabel.text = "\(counter.number)"
        
        
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
