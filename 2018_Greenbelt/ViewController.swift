//
//  ViewController.swift
//  2018_Greenbelt
//
//  Created by David Cate on 2/1/18.
//  Copyright © 2018 David Cate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let greenbeltLogo = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        greenbeltLogo.frame = CGRect(x: 120, y: -200, width: 190, height: 141)
        greenbeltLogo.contentMode = .scaleAspectFill
        greenbeltLogo.image = #imageLiteral(resourceName: "greenbeltlogo.png")
        
        view.addSubview(greenbeltLogo)
        
        self.view = view
        
        siteLaunch()
        
        
    }
    
    @objc func siteLaunch() {
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.7) {
            
            self.greenbeltLogo.frame = CGRect(x: 120, y: 140, width: 190, height: 141)
            
        }
        animator.startAnimation(afterDelay: 1)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

