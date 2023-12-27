//
//  OrderTableViewHeader.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/27.
//

import UIKit

class OrderTableViewHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var OrderTotalUpperStackView: UIStackView!
    @IBOutlet weak var OrderTotalLabel: UILabel!
    @IBOutlet weak var OrderTotalCountLabel: UILabel!
    @IBOutlet weak var OrderTotalPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}
extension OrderTableViewHeader{
    private func setUI(){
        OrderTotalUpperStackView.backgroundColor = UIColor(named: "OrderTotalColor")
        [OrderTotalCountLabel,OrderTotalPriceLabel].forEach({ label in
            label?.textAlignment = .center
        })
        [OrderTotalLabel,OrderTotalCountLabel,OrderTotalPriceLabel].forEach { label in
            label?.textColor = .white
        }
        
    }
}
