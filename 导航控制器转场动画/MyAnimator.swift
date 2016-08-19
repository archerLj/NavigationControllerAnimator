//
//  MyAnimator.swift
//  导航控制器转场动画
//
//  Created by archerLj on 16/8/19.
//  Copyright © 2016年 com.bocodo.csr. All rights reserved.
//

import UIKit

class MyAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let animateDuration = 5.0
    var operation: UINavigationControllerOperation = .push
    weak var context: UIViewControllerContextTransitioning?
    
    func transitionDuration(_ transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animateDuration
    }
    
    func animateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        context = transitionContext
        let containerView = transitionContext.containerView()
        
        
        let animate = CABasicAnimation(keyPath: "transform")
        animate.duration = animateDuration
        animate.delegate = self
        animate.fillMode = kCAFillModeForwards
        animate.isRemovedOnCompletion = false
        
        
        let scale: CGFloat = 35.0
        
        if operation == .push {
            let toVC = transitionContext.viewController(forKey: UITransitionContextToViewControllerKey) as! NextViewController
            let toView = transitionContext.view(forKey: UITransitionContextToViewKey)!
            containerView.addSubview(toView)
            
            animate.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
            animate.toValue = NSValue(caTransform3D: CATransform3DMakeScale(scale, scale, 1.0))
            animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            toVC.maskLayer.layer.add(animate, forKey: nil)
        } else {
            let fromVC = transitionContext.viewController(forKey: UITransitionContextFromViewControllerKey) as! NextViewController
            let toView = transitionContext.view(forKey: UITransitionContextToViewKey)!
            let fromView = transitionContext.view(forKey: UITransitionContextFromViewKey)!
            containerView.addSubview(toView)
            containerView.addSubview(fromView)
            
            
            animate.toValue = NSValue(caTransform3D: CATransform3DIdentity)
            animate.fromValue = NSValue(caTransform3D: CATransform3DMakeScale(scale, scale, 1.0))
            animate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            fromVC.maskLayer.layer.add(animate, forKey: nil)
        }
    }
    
    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
    }
}
