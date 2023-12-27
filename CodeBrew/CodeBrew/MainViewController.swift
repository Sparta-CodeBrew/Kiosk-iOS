//
//  ViewController.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/26.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var orderListView: OrderListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTableView()
    }
}

extension MainViewController {
    private func setupCustomTableView() {
        guard let customTableView = Bundle.main.loadNibNamed("OrderListView", owner: nil)?.first as? OrderListView else { return }
        customTableView.frame = orderListView.bounds
        customTableView.setTableView()
        orderListView.addSubview(customTableView)
    }

}
