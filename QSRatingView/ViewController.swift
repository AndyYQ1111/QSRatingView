//
//  ViewController.swift
//  QSRatingView
//
//  Created by AndyLi on 2019/4/16.
//  Copyright © 2019 AndyLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QSV: QSRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        QSV.totalScore = 10 //默认等于10
        QSV.score = 4.5 //设置当前评分
        QSV.isVariable = false
    }
}

