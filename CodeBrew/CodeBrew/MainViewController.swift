//
//  ViewController.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/26.
//
// ignore파일 추가
import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var orderListView: OrderListView!
    var orderList = [OrderList(menuName: "메뉴1", cnt: 1, menuPrice: 1000,menuTotalPrice: 1000),OrderList(menuName: "메뉴2", cnt: 1, menuPrice: 2000,menuTotalPrice: 2000)]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTableView()
        
    }
    @IBAction func btnPay(_ sender: Any) {
        let alert = UIAlertController(title: "결제 완료", message: "", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default)
        alert.addAction(sucess)
        // 화면에 표현
        present(alert, animated: true)
    }

    // 전체취소 버튼 클릭
    @IBAction func btnAllCancel(_ sender: Any) {
        
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
