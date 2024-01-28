//
//  AViewController.swift
//  RxSwiftDemo
//
//  Created by simon on 2024/1/27.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AViewController:UIViewController{
    
    let cellId = "ViewControllerCell"
    
    static var item1:String = "Item 1"
    static var item2:String = "Item 2"
    static var item3:String = "Item 3"
    static var item4:String = "Item 4"
    
    var tableViewItems = Observable.just([AViewController.item1, AViewController.item2, AViewController.item3, AViewController.item4])
    let disposeBag = DisposeBag()
    
    
    lazy var tableview: UITableView = {
        let tableV:UITableView = UITableView(frame: CGRectZero, style: .plain)
        
        tableV.separatorStyle = .none
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
  
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableview)
        
        
        tableview.frame = CGRectMake(0, CALength.kNavStatusBarHeight, CALength.kScreenWidth, CALength.kScreenHeight -  CALength.kNavStatusBarHeight)
        self.view.backgroundColor = .yellow
        
        tableViewItems.bind(to: tableview
            .rx
            .items(cellIdentifier: cellId)){tv,tableViewItem,cell in
                cell.textLabel?.text = tableViewItem
            }
            .disposed(by: disposeBag)
        
        tableview.rx.modelSelected(String.self).subscribe { item in
            
            if let item = item.element{
                print(item)
            }
            
//            print(item.element ?? "")
//            var item = event.select
//            item = "123"
//            self?.tableViewItems = Observable.just(["Item 1", "Item 1", "Item 1", "Item 1"])
//            print(self?.tableViewItems)
        }.disposed(by: disposeBag)
        
        tableview.rx.itemSelected.subscribe { indexPath in
            if let indexP = indexPath.element{
                
                print(indexP)
            }
        }.disposed(by: disposeBag)
    }
    
    
    

}
