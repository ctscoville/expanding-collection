//
//  SubviewsForEach.swift
//  DemoExpandingCollection
//
//  Created by Alex K. on 26/05/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit

protocol SubviewsForEach {
    func subviewsForEach(f: UIView -> Void)
}

extension SubviewsForEach where Self: UIView {
    
    func subviewsForEach(f: UIView -> Void) {
        forEachView(self, f: f)
    }
    
    private func forEachView(view: UIView, f: UIView -> Void) {
        view.subviews.forEach {
            f($0)
            
            if $0.subviews.count > 0 {
                forEachView($0, f: f)
            }
        }
    }
}

extension UIView: SubviewsForEach {}