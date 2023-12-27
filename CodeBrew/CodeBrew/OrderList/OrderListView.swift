//
//  OrderTableView.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/27.
//

import UIKit

class OrderListView: UIView {
    var orderList = [OrderList(menuName: "메뉴1", cnt: 1, menuPrice: 1000),OrderList(menuName: "메뉴2", cnt: 1, menuPrice: 2000)]
    var cnt = 0
    @IBOutlet weak var OrderListTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    
}
extension OrderListView {
    func setTableView() {
        OrderListTableView.delegate = self
        OrderListTableView.dataSource = self
        OrderListTableView.register(UINib(nibName: "OrderTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "OrderTableViewHeader")
        OrderListTableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCellid")
    }
}
extension OrderListView : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCellid", for: indexPath) as? OrderListTableViewCell else  { return UITableViewCell() }
        cell.setOrderList(model: orderList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderTableViewHeader") as? OrderTableViewHeader else { return UIView()}
        header.OrderTotalCountLabel.text = "0개"
        header.OrderTotalPriceLabel.text = "0원"
        return header
    }
    
}
