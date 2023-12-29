//
//  TopMenuView.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/28.
//

import UIKit

class TopMenuView: UIView {
    @IBOutlet weak var segmentControl: UISegmentedControl!

}
extension TopMenuView{
    func setSegmentControl(){
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = UIColor(named: "SelectMenu")
        segmentControl.backgroundColor = UIColor(named: "UnSelectMenu")
        segmentControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        let unSelectTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "SelectMenu")]
        let selectTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentControl.setTitleTextAttributes(unSelectTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        segmentControl.setTitleTextAttributes(selectTextAttributes, for: .selected)
    }
    @objc func indexChanged(_ sender : UISegmentedControl){
        print(sender.selectedSegmentIndex)
    }
}
