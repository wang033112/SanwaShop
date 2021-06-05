

import UIKit

class UMineViewController: UIViewController {

    private lazy var myArray: Array = {
        return [[["icon":"mine_vip", "title": "アカウント"],
                 ["icon":"mine_coin", "title": "パスワード"]],
            
                [["icon":"mine_accout", "title": "通知設定"],
                 ["icon":"mine_subscript", "title": "ヘルプ"],
                 ["icon":"mine_seal", "title": "アプリについて"]]]
    }()
    
    private lazy var head: UMineHead = {
        return UMineHead(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
    }()
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.background
        tw.delegate = self
        tw.dataSource = self
        tw.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tw.isScrollEnabled = false
        return tw
    }()
    
    lazy var profileView: UIView = {
        let tw = UIView(frame: CGRect(x: 20, y: 60, width: UIScreen.main.bounds.width - 40, height: 200))
        tw.backgroundColor = UIColor.white
        tw.layer.shadowColor = UIColor.gray.cgColor
        tw.layer.shadowRadius = 10
        tw.layer.shadowOpacity = 0.2
        tw.layer.shadowOffset = .zero
        tw.layer.cornerRadius = 10
        return tw
    }()
    
    lazy var contentView: UIView = {
        let tw = UIView(frame: CGRect(x: 20, y: 290, width: UIScreen.main.bounds.width - 40, height: 230))
        tw.backgroundColor = UIColor.white
        tw.layer.shadowColor = UIColor.gray.cgColor
        tw.layer.shadowRadius = 10
        tw.layer.shadowOpacity = 0.2
        tw.layer.shadowOffset = .zero
        tw.layer.cornerRadius = 10
        return tw
    }()
    
    lazy var profileImage: UIImageView = {
        let pImage = UIImage(named: "user_profile")
        let pImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        pImageView.image = pImage
        return pImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
        
        profileView.addSubview(profileImage)
        profileImage.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview().offset(-20)
            
        }

        view.addSubview(contentView)
        contentView.addSubview(tableView)
        
        view.addSubview(profileView)
//        contentView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(290)
//        }
        
        tableView.snp.makeConstraints {
            $0.left.top.right.bottom.equalToSuperview()
        }
//
//        tableView.parallaxHeader.view = head
//        tableView.parallaxHeader.height = 200
//        tableView.parallaxHeader.minimumHeight = navigationBarY
//        tableView.parallaxHeader.mode = .fill
//
//        navigationController?.barStyle(.clear)
        //contentView.contentOffset = CGPoint(x: 0, y: 0)
    }
}

extension UMineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y >= -(scrollView.parallaxHeader.minimumHeight) {
//            navigationController?.barStyle(.theme)
//            navigationItem.title = "我的"
//        } else {
//            navigationController?.barStyle(.clear)
//            navigationItem.title = ""
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = myArray[section]
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
//        guard let _ = cell else {
//            return nil
//        }
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        let sectionArray = myArray[indexPath.section]
        let dict: [String: String] = sectionArray[indexPath.row]
        cell.imageView?.image =  UIImage(named: dict["icon"] ?? "")
        cell.textLabel?.text = dict["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
