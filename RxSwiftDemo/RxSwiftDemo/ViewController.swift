//
//  ViewController.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/1/20.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    //MARK: - Init
   
    
    //MARK: - Public Functions
    
    //MARK: - Delegate
    //MARK: - Data Request
    
    //MARK: - Property & Lazy Load
    var viewModel:HomePageViewModel?
    
    let cellId = "ViewControllerCell"
    
    lazy var tableview: UITableView = {
        let tableV:UITableView = UITableView(frame: CGRectZero, style: .plain)
        
        tableV.separatorStyle = .none
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableV.dataSource = self
        tableV.delegate = self
        return tableV
    }()
    
    
    //MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Entry"
        view.backgroundColor = UIColor.white
        setupSubView()
        
    }
    
    
    //MARK: - Private Functions
    
    func setupSubView(){
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CALength.kNavStatusBarHeight)
            make.left.bottom.right.equalTo(0)
        }
    }
    
    func bindData(){
//        self.viewModel.
    }
    
    //MARK: - Data Request
    func fetchData(){
//        sle
//        self.viewModel
    }


}


extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "123"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseVC = UIViewController()
        baseVC.view.backgroundColor = .yellow
        navigationController?.pushViewController(baseVC, animated: true)
    }
    
}
