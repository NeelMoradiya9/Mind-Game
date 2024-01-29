//
//  ViewController1.swift
//  Mind Game
//
//  Created by Neel  on 26/06/23.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var easybton: UIButton!
    
    @IBOutlet weak var mediumbton: UIButton!
    
    @IBOutlet weak var highbton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        easybton.layer.cornerRadius = (easybton.frame.width)/2
        mediumbton.layer.cornerRadius =
        (mediumbton.frame.width)/2
        highbton.layer.cornerRadius =
        (highbton.frame.width)/2
       
        
        
    }
    
    @IBAction func medac(_ sender: Any) {
        navigation()
    }
    
    @IBAction func highac(_ sender: Any) {
        navigation()
    }
    
    @IBAction func esayaac(_ sender: Any) {
        navigation()
    }
    func navigation()
    {
        let a = storyboard?.instantiateViewController(identifier: "ViewController2")
        as!
        ViewController2
        navigationController?.pushViewController(a, animated: true)
    }
    

}
