//
//  ViewController.swift
//  MXScroll
//
//  Created by cillyfly on 07/18/2018.
//  Copyright (c) 2018 cillyfly. All rights reserved.
//

import MXScroll
import UIKit
let Segment_statu_titleNormal = UIFont(name: "PingFangSC-Regular", size: 16)!
let Segment_statu_titleSelected = UIFont(name: "PingFangSC-Medium", size: 16)!
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        jumpToMixVC(sender.tag)
    }
    
    func jumpToMixVC(_ tag:Int) {
       
        let header = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HeaderViewController")
        
        let headerScroll = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HeaderViewController2")
        
        let headerNormal = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HeaderViewController3")
        
        var hh:UIViewController!
        if tag == 0{
            hh = header
        }else if tag == 1{
            hh = headerScroll
        }else if tag == 2{
            hh = headerNormal
        }
        
        let child1 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChildViewController")
        
        let child2 = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController")
        
        let segment = MSSegmentControl(sectionTitles: ["Comment", "Sports"])
        setupSegment(segmentView: segment)
        
        let mx = MXViewController<MSSegmentControl>.init(headerViewController: hh, segmentControllers: [child1, child2], segmentView: segment)
        mx.headerViewOffsetHeight = 10
        mx.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navigationController?.pushViewController(mx, animated: true)
    }
    
    func setupSegment(segmentView: MSSegmentControl) {
        segmentView.borderType = .none
        segmentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0, alpha: 1)
        segmentView.selectionIndicatorColor = #colorLiteral(red: 0.9759539962, green: 0.3313286304, blue: 0.008939011954, alpha: 1)
        segmentView.selectionIndicatorHeight = 2
        
        segmentView.selectedTitleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.9759539962, green: 0.3313286304, blue: 0.008939011954, alpha: 1), NSAttributedStringKey.font: Segment_statu_titleSelected]
        segmentView.titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), NSAttributedStringKey.font: Segment_statu_titleNormal]
        
        segmentView.segmentWidthStyle = .fixed
        
        segmentView.indicatorWidthPercent = 1
        segmentView.selectionStyle = .textWidth
    }
}
