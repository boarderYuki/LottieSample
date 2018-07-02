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
    
    var menuOn = false
    var hamburgerMenuButton:LOTAnimationView?
    let hamburgerMenuFrame = CGRect(x: 0, y: 10, width: 75, height: 75)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addHamburgerMenuButton(on: menuOn)
    }

    func addHamburgerMenuButton (on:Bool) {
        if hamburgerMenuButton != nil {
            hamburgerMenuButton?.removeFromSuperview()
            hamburgerMenuButton = nil
        }
        
        
        let animation = on ? "buttonOff" : "buttonOn"
        
        hamburgerMenuButton = LOTAnimationView(name: animation)
        hamburgerMenuButton?.isUserInteractionEnabled = true
        hamburgerMenuButton?.frame = hamburgerMenuFrame
        hamburgerMenuButton?.contentMode = .scaleAspectFill
        
        addMenuToggleRecognizer()
        
        self.view.addSubview(hamburgerMenuButton!)
        
    }
    
    func addMenuToggleRecognizer (){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.toggleMenu(recognizer:)))
        
        tapRecognizer.numberOfTapsRequired = 1
        
        hamburgerMenuButton?.addGestureRecognizer(tapRecognizer)
        
    }
    
    @objc func toggleMenu (recognizer:UITapGestureRecognizer) {
        
        if !menuOn {
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = true
                self.addHamburgerMenuButton(on: self.menuOn)
            })
        }else{
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = false
                self.addHamburgerMenuButton(on: self.menuOn)
            })
        }
        
    }
    
    @IBAction func showAni(_ sender: Any) {
        let aniView2 = LOTAnimationView(name: "3d_rotate_loading_animation")
        aniView2.frame = CGRect(x: 0, y: 0, width: aniView.frame.size.width, height: aniView.frame.size.height)
        aniView2.contentMode = .scaleAspectFit
        
        aniView2.loopAnimation = true
        self.aniView?.addSubview(aniView2)
        aniView2.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

