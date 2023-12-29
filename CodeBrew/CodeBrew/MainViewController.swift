//
//  ViewController.swift
//  CodeBrew
//
//  Created by 원동진 on 2023/12/26.
//
// ignore파일 추가
import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var topMenuView: TopMenuView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var orderListView: OrderListView!
    var menuList = coffeMenu
    let sectionlnsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var menuNum = 0
    var orderList : [OrderList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopMenuCategory()
        setupCustomTableView()
        setCollectionView()
        setBtnUI()
    }

    // 결제 버튼
    @IBAction func btnPay(_ sender: Any) {
        let totalMoney = orderList.map{$0.menuTotalPrice}.reduce(0, +)
        let alert = UIAlertController(title: "결제 금액은 \(totalMoney)입니다.", message: "결제하시겠습니까 ?", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default)
        alert.addAction(sucess)
        present(alert, animated: true)
        orderList.removeAll()
        setupCustomTableView()
    }
    // 전체취소 버튼
    @IBAction func btnAllCancel(_ sender: Any) {
        orderList.removeAll()
        setupCustomTableView()
    }
}

extension MainViewController {
    // 상단메뉴 View 생성
    private func setTopMenuCategory(){
        guard let customView = Bundle.main.loadNibNamed("TopMenuView", owner: nil)?.first as? TopMenuView else {return}
        customView.setSegmentControl()
        customView.frame = topMenuView.bounds
        // 메뉴 카테고리 변경
        customView.segmentControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        topMenuView.addSubview(customView)
    }
    private func setCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    // 주문내역 view 생성
    private func setupCustomTableView() {
        guard let customTableView = Bundle.main.loadNibNamed("OrderListView", owner: nil)?.first as? OrderListView else { return }
        customTableView.setOrderList(list:orderList)
        customTableView.setOrderListSum(sum: orderList.map{$0.menuPrice}.reduce(0, +))
        customTableView.setTableView()
        orderListView.addSubview(customTableView)
    }
    // 버튼 UI 설정
    private func setBtnUI(){
        cancelBtn.backgroundColor = .black
        payBtn.backgroundColor = .systemIndigo
        [cancelBtn,payBtn].forEach { btn in
            btn?.layer.cornerRadius = 10
            btn?.layer.borderWidth = 1
            btn?.tintColor = .white
            btn?.layer.borderColor = .none
        }
        
        
    }
    // 메뉴 카테고리 변경
    @objc func indexChanged(_ sender : UISegmentedControl){
        switch sender.selectedSegmentIndex{
            case 0:
            menuList = coffeMenu
            case 1:
            menuList = frappuccino
            case 2:
            menuList = blended
            case 3:
            menuList = coleBrew
        default:
            menuList = coffeMenu
        }
        collectionView.reloadData()
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
// 선택된 메뉴 주문내역에 추가하기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuName = menuList[indexPath.row].menuName
        let menuPrice = menuList[indexPath.row].menuPrice
        if orderList.contains(where: { orderList in
            orderList.menuName == menuName
        }){
            let alert = UIAlertController(title: "중복된 메뉴", message: "주문 내역에서 개수를 추가 해주세요.", preferredStyle: .alert)
            let sucess = UIAlertAction(title: "확인", style: .default)
            alert.addAction(sucess)
            present(alert, animated: true)
        }else{
            orderList.append(OrderList(menuName: menuName, cnt: 1, menuPrice: menuPrice, menuTotalPrice: menuPrice))
        }
        setupCustomTableView()
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
