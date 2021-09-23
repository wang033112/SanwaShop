//
//  HomeBannerView.swift
//  Shop
//
//  Created by Ouketsu on 2021/06/12.
//

import UIKit

class CategoryViewController: UIViewController {

    //左侧表格
    lazy var leftTableView : UITableView = {
        let leftTableView = UITableView()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.frame = CGRect(x: 0, y: 0, width: 80,
                                     height: UIScreen.main.bounds.height)
        leftTableView.rowHeight = 55
        leftTableView.showsVerticalScrollIndicator = false
        leftTableView.separatorColor = UIColor.clear
        leftTableView.register(LeftTableViewCell.self,
                               forCellReuseIdentifier: "leftTableViewCell")
        return leftTableView
    }()
    
    //右侧表格
    lazy var rightTableView : UITableView = {
        let rightTableView = UITableView()
        rightTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.frame = CGRect(x: 80, y: 64,
                                      width: UIScreen.main.bounds.width - 80,
                                      height: UIScreen.main.bounds.height - 64)
        rightTableView.rowHeight = 80
        rightTableView.showsVerticalScrollIndicator = false
        rightTableView.register(RightTableViewCell.self,
                                forCellReuseIdentifier: "rightTableViewCell")
        return rightTableView
    }()
    
    //左侧表格数据
    var leftTableData = [String]()
    //右侧表格数据
    var rightTableData = [[RightTableModel]]()
    
    //右侧表格当前是否正在向下滚动（即true表示手指向上滑动，查看下面内容）
    var rightTableIsScrollDown = true
    //右侧表格垂直偏移量
    var rightTableLastOffsetY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化左侧表格数据
        for i in 1..<15 {
            self.leftTableData.append("分类\(i)")
        }
        
        //初始化右侧表格数据
        for leftItem in leftTableData {
            var models = [RightTableModel]()
            for i in 1..<5 {
                models.append(RightTableModel(name: "\(leftItem) - 外卖菜品\(i)",
                    picture: "image", price: Float(i)))
            }
            self.rightTableData.append(models)
        }
        
        //将表格添加到页面上
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
        
        //左侧表格默认选中第一项
        leftTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true,
                                scrollPosition: .none)
    }
}

extension CategoryViewController : UITableViewDataSource, UITableViewDelegate {
    //表格分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        if leftTableView == tableView {
            return 1
        } else {
            return leftTableData.count
        }
    }
    
    //分区下单元格数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if leftTableView == tableView {
            return leftTableData.count
        } else {
            return rightTableData[section].count
        }
    }
    
    //返回自定义单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        if leftTableView == tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftTableViewCell",
                                                     for: indexPath) as! LeftTableViewCell
            cell.titleLabel.text = leftTableData[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightTableViewCell",
                                                     for: indexPath) as! RightTableViewCell
            let model = rightTableData[indexPath.section][indexPath.row]
            cell.setData(model)
            return cell
        }
    }

    //分区头高度（只有右侧表格有分区头）
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if leftTableView == tableView {
            return 0
        }
        return 30
    }
    
    //返回自定义分区头（只有右侧表格有分区头）
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if leftTableView == tableView {
            return nil
        }
        let headerView = RightTableViewHeader(frame: CGRect(x: 0, y: 0,
                                            width: UIScreen.main.bounds.width, height: 30))
        headerView.titleLabel.text = leftTableData[section]
        return headerView
    }
    
    //分区头即将要显示时调用
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        //如果是右侧表格，且是是由用户手动滑动屏幕造成的向上滚动
        //那么左侧表格自动选中该分区对应的分类
        if (rightTableView == tableView)
            && !rightTableIsScrollDown
            && (rightTableView.isDragging || rightTableView.isDecelerating) {
            leftTableView.selectRow(at: IndexPath(row: section, section: 0),
                                    animated: true, scrollPosition: .top)
        }
    }
    
    //分区头即将要消失时调用
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView,
                   forSection section: Int) {
        //如果是右侧表格，且是是由用户手动滑动屏幕造成的向下滚动
        //那么左侧表格自动选中该分区对应的下一个分区的分类
        if (rightTableView == tableView)
            && rightTableIsScrollDown
            && (rightTableView.isDragging || rightTableView.isDecelerating) {
            leftTableView.selectRow(at: IndexPath(row: section + 1, section: 0),
                                    animated: true, scrollPosition: .top)
        }
    }
    
    //单元格选中时调用
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //点击的是左侧单元格时
        if leftTableView == tableView {
            //右侧表格自动滚动到对应的分区
            rightTableView.scrollToRow(at: IndexPath(row: 0, section: indexPath.row),
                                       at: .top, animated: true)
            //左侧表格将该单元格滚动到顶部
            leftTableView.scrollToRow(at: IndexPath(row: indexPath.row, section: 0),
                                      at: .top, animated: true)
        }
    }

    //表格滚动时触发（主要用于记录当前右侧表格时向上还是向下滚动）
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tableView = scrollView as! UITableView
        if rightTableView == tableView {
            rightTableIsScrollDown = rightTableLastOffsetY < scrollView.contentOffset.y
            rightTableLastOffsetY = scrollView.contentOffset.y
        }
    }
}

