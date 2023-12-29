//
//  TopMenuView.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/28.
//

import UIKit

class TopMenuView: UIView {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var menuList = coffeMenu
}
extension TopMenuView{
    func setSegmentControl(){
        segmentControl.selectedSegmentIndex = 0 // 제일 처음 선 택 Index
        let unSelectTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "SelectMenu")]
        let selectTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let font = UIFont.systemFont(ofSize: 10) // 전체 Font 크기
        segmentControl.setTitleTextAttributes(unSelectTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        segmentControl.setTitleTextAttributes(selectTextAttributes, for: .selected)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segmentControl.selectedSegmentTintColor = UIColor(named: "SelectMenu")
        segmentControl.backgroundColor = UIColor(named: "UnSelectMenu")
        
   
    }
}
