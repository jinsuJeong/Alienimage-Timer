//
//  ViewController.swift
//  Alienimage Timer
//
//  Created by D7703_02 on 2018. 4. 4..
//  Copyright © 2018년 D7703_02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 1
    var myTimer = Timer()
    var direction = 1
    var cheak = true
    
    @IBOutlet weak var myImageView: UIImageView!
    
      @IBOutlet weak var bt: UIButton!
      @IBOutlet weak var imageCounter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageCounter.text = String(counter)
        myImageView.image = UIImage(named: "frame1.png")//첫사진이 나오게함
    }

    @IBAction func btStart(_ sender: UIButton) {
        if cheak == true {
            
         myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            cheak = false
            bt.setTitle("Stop", for: .normal)
        }else if cheak == false{
            myTimer.invalidate()
            cheak = true
            bt.setTitle("Start", for: .normal)
        }
        
    }
    

    @objc func doAnimation(){
      
        if counter == 5{
            direction = 0
        }
        else if counter == 1{
            direction = 1
        }
        if direction == 1{
            counter += 1
        }
        else if direction == 0{
            counter = counter - 1
        }
        
        myImageView.image = UIImage(named: "frame\(counter).png")
        imageCounter.text = String(counter)
    }
}

