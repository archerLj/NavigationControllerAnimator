//
//  ViewController.swift
//  导航控制器转场动画
//
//  Created by archerLj on 16/8/19.
//  Copyright © 2016年 com.bocodo.csr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    let transition = MyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "大哈"
        myButton.layer.cornerRadius = 22.0
        navigationController?.delegate = self
    }
    @IBAction func btnAction(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "nextViewControllerSB") as! NextViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.operation = operation
        return transition
    }
}
