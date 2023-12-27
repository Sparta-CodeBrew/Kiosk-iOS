//
//  OrderListTableViewCell.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/27.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuCntLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    var cnt = 1
    var price = 0
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
    }
    
    @IBAction func tapPlustCnt(_ sender: UIButton) {
        cnt+=1
        menuCntLabel.text = "\(cnt)"
        menuPriceLabel.text = "\(price * cnt)원"
    }
    @IBAction func tapMinusCnt(_ sender: UIButton) {
        if cnt > 0 {
            cnt-=1
        }
        menuCntLabel.text = "\(cnt)"
        menuPriceLabel.text = "\(price * cnt)원"
    }
}
extension OrderListTableViewCell{
    private func setUI(){
        menuNameLabel.textAlignment = .left
        menuCntLabel.textAlignment = .center
        menuPriceLabel.textAlignment = .right
    }
    func setOrderList(model : OrderList){
        menuNameLabel.text = model.menuName
        menuCntLabel.text = "\(model.cnt)"
        menuPriceLabel.text = "\(model.menuPrice)원"
        cnt = model.cnt
        price = model.menuPrice
    }
}
