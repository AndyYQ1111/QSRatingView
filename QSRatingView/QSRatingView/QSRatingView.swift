//
//  QSRatingView.swift
//  QSRatingView
//
//  Created by AndyLi on 2019/4/16.
//  Copyright © 2019 AndyLi. All rights reserved.
//

import UIKit

@IBDesignable class QSRatingView: UIView {
    
    @IBOutlet var contentView: UIView!

    //总分
    var totalScore:CGFloat = 10.0
    //评分
    var score:CGFloat = 0.0 {
        didSet{
            let offset = (score / totalScore) * self.bounds.width
            self.move(offset: offset)
        }
    }
    //是否可手势改变显示的值
    var isVariable = true {
        didSet{
            if(isVariable == false){
                self.isUserInteractionEnabled = false
            }else{
                self.isUserInteractionEnabled = true
            }
        }
    }
    
    private var foregroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialFromeXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialFromeXib()
    }

    func initialFromeXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib.init(nibName: "QSRatingView", bundle: bundle)
        contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(userTapRateView(sender:)))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
    }
    
    @objc func userTapRateView(sender:UITapGestureRecognizer){
        let tapPoint = sender.location(in: self)
        let offset = tapPoint.x
        print(self.bounds.width)
        print(offset)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let tapPoint = touch?.location(in: self)
        let offset = tapPoint!.x
        
        move(offset: offset)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let tapPoint = touch?.location(in: self)
        let offset = tapPoint!.x
        
        move(offset: offset)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let tapPoint = touch?.location(in: self)
        let offset = tapPoint!.x
        
        move(offset: offset)
    }
    
    func move(offset:CGFloat){
        var offset = offset
        if(offset > self.bounds.width){
            offset = self.bounds.width
        }
        if(offset < 0){
            offset = 0
        }
        
        foregroundView.frame = CGRect(x: 0, y: 0, width: offset, height: self.bounds.height)
        foregroundView.clipsToBounds = true
        let imgvW = self.bounds.width / 5
        let imgvH = self.bounds.height
        for i in 0..<5 {
            let imgv = UIImageView(image: UIImage(named: "star"))
            imgv.frame = CGRect(x: imgvW * CGFloat(i), y: 0, width: imgvW, height: imgvH)
            imgv.contentMode = .scaleAspectFit
            foregroundView.addSubview(imgv)
        }
        if(!self.subviews.contains(foregroundView)){
            addSubview(foregroundView)
        }
    }
}
