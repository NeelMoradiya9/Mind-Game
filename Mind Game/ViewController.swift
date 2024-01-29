//
//  ViewController.swift
//  Mind Game
//
//  Created by Neel  on 26/06/23.
//

import UIKit

class ViewController: UIViewController {
    var time = Timer()
    @IBOutlet weak var pg: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pg.progress = 0.0
        
    }

    @IBAction func playbutton(_ sender: Any) {
        progressbar()
    }
    

    
    func progressbar()
    {
        var a = pg.progress
        
        time = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { _ in
            a += 0.01
            self.pg.progress = a
            print(self.pg.progress)
            if self.pg.progress == 1.0
           
            {
                self.pg.progress = 0.0
                self.time.invalidate()
                navigate()
                
            }
           
            func navigate()
            {
                let a = self.storyboard?.instantiateViewController(identifier: "ViewController1") as! ViewController1
                self.navigationController?.pushViewController(a, animated: true)
                
            }
        }
    }
    
}

