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
import SnapKit

class AViewController:UIViewController{
    
    let cellId = "ViewControllerCell"
    
//    static var item1:String = "Item 1"
//    static var item2:String = "Item 2"
//    static var item3:String = "Item 3"
//    static var item4:String = "Item 4"
    
    var tableViewItems = Observable.just(["Item 1", "Item 2", "Item 3", "Item 4"])
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
        
//        Observable.create { observer in
//
//        }
        
        
        tableview.frame = CGRectMake(0, CALength.kNavStatusBarHeight, CALength.kScreenWidth, CALength.kScreenHeight -  CALength.kNavStatusBarHeight)
        
        tableview.snp.makeConstraints { make in
            
        }
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

public protocol TestProtocol {
    associatedtype Element
//    var age:Element {get set}
    func test1(paramas:Element)
}

//方式1: 直接typealias起别名
class TestClass : TestProtocol{
    typealias Element = Int

    func test1(paramas: Element) {

    }
}

//方式2:直接定义Class中定义泛型
class Test2Class<Element> : TestProtocol{
    func test1(paramas: Element) {

    }
}

//方式3-1 在fun函数 或者 age属性中声明
class Tes3Class: TestProtocol{
    func test1(paramas: String) {
        
    }
}

public protocol TestProtocol1 {
    associatedtype Element
    var age:Element {get set}
    func test1(paramas:String)
}


//方式3-2 在fun函数 或者 age属性中声明
class Tes4Class: TestProtocol1{
    
    var age: String{
        get{
            return "1"
        }
        set{}
    }
    
    func test1(paramas: String) {
    }
}
