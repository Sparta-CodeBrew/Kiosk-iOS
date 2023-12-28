//
//  PayViewController.swift
//  CodeBrew
//
//  Created by Joseph on 12/27/23.
//

import UIKit

class PayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // 결제하기 버튼 클릭
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
