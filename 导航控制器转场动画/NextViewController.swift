//
//  NextViewController.swift
//  导航控制器转场动画
//
//  Created by archerLj on 16/8/19.
//  Copyright © 2016年 com.bocodo.csr. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maskLayer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "二哈"
        
        maskLayer.layer.cornerRadius = 22.0
        view.layer.mask = maskLayer.layer
    }
}
