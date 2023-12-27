//
//  ViewController.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/26.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var orderListView: OrderListView!
    var orderList = [OrderList(menuName: "메뉴1", cnt: 1, menuPrice: 1000,menuTotalPrice: 1000),OrderList(menuName: "메뉴2", cnt: 1, menuPrice: 2000,menuTotalPrice: 2000)]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTableView()
    }
}

extension MainViewController {
    private func setupCustomTableView() {
        guard let customTableView = Bundle.main.loadNibNamed("OrderListView", owner: nil)?.first as? OrderListView else { return }
        customTableView.setOrderList(list:orderList)
        customTableView.setOrderListSum(sum: orderList.map{$0.menuPrice}.reduce(0, +))
        customTableView.setTableView()
        
        orderListView.addSubview(customTableView)
    }

}
