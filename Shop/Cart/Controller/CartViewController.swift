//
//  CartViewController.swift
//  Shop
//
//  Created by Ouketsu on 2021/05/15.
//

import UIKit

class CartViewController: BaseViewController {

    lazy var discountView: CartDiscountView = {
        let discountView = CartDiscountView.init(frame: CGRect.zero)
        return discountView
    }()
    
    lazy var settlementView: CartSettlementView = {
        let settlementView = CartSettlementView.init(frame: CGRect.zero)
        return settlementView
    }()
    
    lazy var listView: CartListView = {
        let listView = CartListView.init(frame: CGRect.zero)
        listView.productData = productData
        listView.tableView.ryjHead = RefreshNormalHeader {
            [weak self] in self?.loadData()
        }
        return listView
    }()
    
    lazy var productData: Array<CartModel> = {
        let data = CartModel.defaultData()
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // 计算总价
        calculateTotalPrice()
        // 删除产品的回调
        listView.editingDeleteBlock = {
            [weak self] in self?.deleteProduct(indexPath: $0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 列表左滑删除
        listView.addDeleteButton()
    }
    
    
    func setupUI() {
        self.titleLabel.text = "Cart"
        
        self.view.addSubview(discountView)
        discountView.snp.makeConstraints {
            $0.left.equalTo(self.view.snp.left).offset(20)
            $0.top.equalTo(self.titleLine.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-20)
            $0.height.equalTo(50)
        }
        
        settlementView.settlementClickBlock = {
            [weak self] in
            let detailVC = CheckoutViewController.init()
            detailVC.modalPresentationStyle = .fullScreen
            self?.present(detailVC, animated: true, completion: {})
        }
        self.view.addSubview(settlementView)
        settlementView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.height.equalTo(60)
        }
        
        self.view.addSubview(listView)
        listView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(discountView.snp.bottom).offset(10)
            $0.bottom.equalTo(settlementView.snp.top)
        }
    }
    
    func deleteProduct(indexPath: IndexPath) {
        self.productData.remove(at: indexPath.row)
        self.listView.productData = self.productData
        self.listView.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        // 从新计算价格
        calculateTotalPrice()
    }
    
    func calculateTotalPrice() {
        var totalPrice = 0.0
        for model in self.productData {
            totalPrice += Double(model.pdPrice!)!
        }
        settlementView.settlementButton.setTitle("$ \(totalPrice)", for: UIControl.State.normal)
    }
    
    func loadData() {
        self.productData = CartModel.defaultData()
        self.listView.productData = self.productData
        self.listView.tableView.reloadData()
        calculateTotalPrice()
        self.listView.tableView.ryjHead.endRefreshing()
    }
}
