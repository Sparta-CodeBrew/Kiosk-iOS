//
//  OrderTableView.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/27.
//

import UIKit

class OrderListView: UIView {
    var orderList : [OrderList] = []
    var cnt = 0
    var orderListTotalSum = 0
    var orderListPrice : [Int] = []
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
    func setOrderList(list : [OrderList]){
        orderList = list
    }
    func setOrderListSum(sum : Int){
        orderListTotalSum = sum
    }
}
extension OrderListView : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCellid", for: indexPath) as? OrderListTableViewCell else  { return UITableViewCell() }
        cell.setOrderList(model: orderList[indexPath.row])
 
        cell.tapPlusButtonClosure = { // 메뉴 개수 추가
            cell.cnt+=1
            cell.totalPrice = cell.price * cell.cnt // 메뉴 하나당 전체 가격
            self.orderList[indexPath.row].cnt = cell.cnt // 추가한 개수 저장
            self.orderList[indexPath.row].menuTotalPrice = cell.totalPrice // 추가한 개수로 인한 메뉴 전체 가격 저장
            self.orderListTotalSum += cell.price // 전체 주문 금액 추가
            tableView.reloadData()
        }
        cell.tapMinusButtonClosure = {
            if cell.cnt > 0{
                cell.cnt-=1
                self.orderListTotalSum -= cell.price // 전체 주문 금액 감소
            }
            cell.totalPrice = cell.price * cell.cnt // 메뉴 하나당 전체 가격
            self.orderList[indexPath.row].cnt = cell.cnt // 감소한 개수 저장
            self.orderList[indexPath.row].menuTotalPrice = cell.totalPrice // 감소한 개수로 인한 메뉴 전체 가격 저장
            tableView.reloadData()
        }
        
        return cell
    }
// 총 주문 내역 화면
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderTableViewHeader") as? OrderTableViewHeader else { return UIView()}
        let sum = orderList.map{$0.cnt}.reduce(0, +)
        header.OrderTotalCountLabel.text = "\(sum)개"
        header.OrderTotalPriceLabel.text = "\(orderListTotalSum)원"
        return header
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            orderList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
