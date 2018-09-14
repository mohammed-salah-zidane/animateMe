//
//  ViewController.swift
//  anim
//
//  Created by Mohamed Salah Zidane on 7/8/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
      var num = 0
    var flag = false
    @IBOutlet var image: UIImageView!
    @IBAction func fadeIN(_ sender: Any) {
    
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    @IBAction func slideIn(_ sender: Any) {
    
        image.center = CGPoint(x: image.center.x , y: 50)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x , y:  self.image.center.y + 300)
        })
    }
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: image.center.x, y: image.center.y, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: self.image.center.x - 100, y: self.image.center.y - 100, width: 200, height: 200)

        })
    }
    
    @IBAction func animate(_ sender: Any) {
    
       
        if !flag{
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector((timeProcess)), userInfo: nil, repeats: true)
         flag = true
        }else{
            timer.invalidate()
            flag = false
        }
        
        
    }
    @objc func timeProcess(){
        
      
        if num < 31 {
        image.image = UIImage(named: "frame_\(num)_delay.gif")
        num = num + 1
        }
        if num == 30{
            num = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

