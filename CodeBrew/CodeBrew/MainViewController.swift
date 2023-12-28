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
    
    @IBOutlet weak var collectionView: UICollectionView!
    var menuList = sample
    let sectionlnsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var orderList = [OrderList(menuName: "메뉴1", cnt: 1, menuPrice: 1000,menuTotalPrice: 1000),OrderList(menuName: "메뉴2", cnt: 1, menuPrice: 2000,menuTotalPrice: 2000)]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTableView()
        
    }

    // 결제 버튼
    @IBAction func btnPay(_ sender: Any) {
        let alert = UIAlertController(title: "결제 완료", message: "", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default)

        alert.addAction(sucess)
        present(alert, animated: true)
    }

    // 전체취소 버튼
    @IBAction func btnAllCancel(_ sender: Any) {
        orderList.removeAll()
        //orderListView.OrderListTableView.reloadData()

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

//
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCollectionViewCell
        
        cell.menuIamge.image = UIImage(named: "\(menuList[indexPath.row].menuImage)")
        cell.menuName.text = "\(menuList[indexPath.row].menuName)"
        cell.menuPrice.text = "\(menuList[indexPath.row].menuPrice)"
        
        return cell
    }
    
    
}

// CollectionViewCell 크기 조절
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let heigth = collectionView.frame.height
        let itemsPerRow: CGFloat = 2
        let widthPadding = sectionlnsets.left * (itemsPerRow + 1)
        let itemsPerColumn: CGFloat = 3
        let heigthPadding = sectionlnsets.top * (itemsPerColumn + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        let cellHeigth = (heigth - heigthPadding) / itemsPerColumn
        
        return CGSize(width: cellWidth, height: cellHeigth)
    }
}
