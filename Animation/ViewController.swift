//
//  ViewController.swift
//  Animation
//
//  Created by Leo on 2018/7/10.
//  Copyright © 2018年 SPIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let contaier = UIView.init(frame:CGRect(x: 80, y: 80, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contaier.backgroundColor = UIColor.red
        self.view.addSubview(contaier)
        animation4()
    }
    //begin - commit
    func animation1() {
        UIView.beginAnimations("move", context: nil)
        UIView.setAnimationDuration(2.0);
        UIView.setAnimationDelegate(self)
        contaier.backgroundColor = UIColor.red
        contaier.center = CGPoint(x: 100, y: 100);
        
        
        UIView.commitAnimations()
    }
    //animation block
    func animation2(){
        
        contaier.backgroundColor = UIColor.red
        
        contaier.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 1.0) {
            self.contaier.transform = CGAffineTransform(scaleX: 2.0, y: 2.0);
        }
    }
    //属性动画的俩种类型
    func animation3(){
        let transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.beginAnimations("scale", context: nil)
        UIView.setAnimationDuration(2)
        UIView.setAnimationDelegate(self)
        contaier.transform = transform
        
        UIView.commitAnimations()
        
    }
    //如果在程序中改变了某个控件的 transform，那么请不要使用这个控件的 frame 计算 子控件 的布局，应该使用 bounds+center 代替。
    func animation4(){
        contaier.layer.transform = CATransform3DIdentity;
        UIView.animate(withDuration: 2.0) {
//        self.contaier.layer.transform = CATransform3DMakeScale(2, 2, 2.0);
            
            self.contaier.layer.transform = CATransform3DConcat(CATransform3DMakeScale(2, 2, 1), CATransform3DMakeRotation(CGFloat(M_PI/4), 0, 0, 1))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

