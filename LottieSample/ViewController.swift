//
//  ViewController.swift
//  LottieSample
//
//  Created by yuki.pro on 2018. 7. 2..
//  Copyright © 2018년 yuki. All rights reserved.
//

import UIKit
import Lottie


class ViewController: UIViewController {


    @IBOutlet weak var aniView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let aniView2 = LOTAnimationView(name: "3d_rotate_loading_animation")
        aniView2.frame = CGRect(x: 0, y: 0, width: aniView.frame.size.width, height: aniView.frame.size.height)
        aniView2.contentMode = .scaleAspectFit
        aniView2.loopAnimation = true
        self.aniView?.addSubview(aniView2)
        aniView2.play()
    }

    
    @IBAction func showAni(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

