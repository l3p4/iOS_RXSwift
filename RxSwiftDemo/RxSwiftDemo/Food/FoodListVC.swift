//
//  FoodListVC.swift
//  RxSwiftDemo
//
//  Created by simon on 2024/1/27.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class FoodListVC:UIViewController{
    
    
    

    
    let cellId = "ViewControllerCell"
    
    static var item1:String = "image_1"
    static var item2:String = "image_2"
    static var item3:String = "image_3"
    
  
    
//    let tableViewItems:BehaviorRelay = BehaviorRelay.init(value:
//        [Food(name:"Piza",imageNmae: "image_1"),
//         Food(name:"Noodle",imageNmae: "image_2"),
//         Food(name:"Cake",imageNmae: "image_3"),
//         Food(name:"Beef",imageNmae: "image_1"),
//         Food(name:"Rice",imageNmae: "image_2"),
//         Food(name:"FryChicken",imageNmae: "image_3"),
//         Food(name:"FryFish",imageNmae: "image_1"),
//         Food(name:"Sala",imageNmae: "image_2"),
//         Food(name:"BBQ",imageNmae: "image_3")])
    
    let tableViewSections:BehaviorRelay = BehaviorRelay.init(value:[
        
        SectionModel(header: "test1", items: [
            Food(name:"Piza",imageNmae: "image_1"),
            Food(name:"Noodle",imageNmae: "image_2"),
            Food(name:"Cake",imageNmae: "image_3"),
            Food(name:"Beef",imageNmae: "image_1"),
            Food(name:"Rice",imageNmae: "image_2"),
            Food(name:"FryChicken",imageNmae: "image_3"),
            Food(name:"FryFish",imageNmae: "image_1")
        ]),
     
     SectionModel(header: "test2", items: [
        Food(name:"Piza",imageNmae: "image_1"),
         Food(name:"Noodle",imageNmae: "image_2"),
         Food(name:"Cake",imageNmae: "image_3"),
         Food(name:"Beef",imageNmae: "image_1"),
         Food(name:"Rice",imageNmae: "image_2"),
         Food(name:"FryChicken",imageNmae: "image_3"),
         Food(name:"FryFish",imageNmae: "image_1")
     ])
    ])
    
//    var tableViewItems = BehaviorRelay.just(
//        [Food(name:"Piza",imageNmae: "image_1"),
//         Food(name:"Noodle",imageNmae: "image_2"),
//         Food(name:"Cake",imageNmae: "image_3"),
//         Food(name:"Beef",imageNmae: "image_1"),
//         Food(name:"Rice",imageNmae: "image_2"),
//         Food(name:"FryChicken",imageNmae: "image_3"),
//         Food(name:"FryFish",imageNmae: "image_1"),
//         Food(name:"Sala",imageNmae: "image_2"),
//         Food(name:"BBQ",imageNmae: "image_3")])
    
    let disposeBag = DisposeBag()
    
//    let dataSource = RxTableViewSectionedReloadDataSource<SecctionModel> { dataSource, tableview, indexPath, item in
//
//        let cell: UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "ViewControllerCell") ?? UITableViewCell()
//        cell.textLabel?.text = item.name
//        cell.imageView?.image = UIImage.init(named: item.imageNmae)
//        return cell
//    }
    

    
    
    
    lazy var tableview: UITableView = {
        let tableV:UITableView = UITableView(frame: CGRectZero, style: .plain)
        
        tableV.separatorStyle = .none
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let btn = UIButton(type: .custom)
        btn.rx.tap
            .subscribe { item in
                
            }
//        btn.rx.isEnabled
//        UISwitch().rx.value.asObservable().
        
//        Observable.of(1,2).flatMap(<#T##selector: (Int) throws -> ObservableConvertibleType##(Int) throws -> ObservableConvertibleType#>)
        
        
        
//        btn.rx.isEnabled.onNext(<#T##element: Bool##Bool#>)
  
        return tableV
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchB = UISearchBar()
    
        return searchB
    }()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel>(
                configureCell: { dataSource, tableView, indexPath, item in
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ViewControllerCell", for: indexPath)
                    cell.textLabel?.text = item.name
                    cell.imageView?.image = UIImage(named: item.imageNmae)
                    return cell
                },
                titleForHeaderInSection: { dataSource, index in
                    return dataSource.sectionModels[index].header
                }
                
//                ,
//
//                titleForFooterInSection: {
//                    dataSource, index in
//                    return dataSource.sectionModels[index].header
//
//                }
                
//                tableView(_ tableView: UITableView, observedEvent: Event<Element>){
//
//                }
//                tableView(<#T##UITableView#>, observedEvent: <#T##Event<Sequence>#>)
                
            )
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(TestTimerDeinitVC(), animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableview)
        tableview.frame = CGRectMake(0, CALength.kNavStatusBarHeight + 50, CALength.kScreenWidth, CALength.kScreenHeight -  CALength.kNavStatusBarHeight - 50)
        
        self.view.addSubview(searchBar)
        searchBar.frame = CGRectMake(0, CALength.kNavStatusBarHeight, CALength.kScreenWidth, 44)
        searchBar.snp.makeConstraints { make in
            
        }
        
       
        
        
        
        
//        tableViewItems.bind(to: tableview
//            .rx
//            .items(cellIdentifier: cellId)){tv,tableViewItem,cell in
//
//                cell.textLabel?.text = tableViewItem.name
//                cell.imageView?.image = UIImage.init(named: tableViewItem.imageNmae ?? "")
//            }
//            .disposed(by: disposeBag)
        
        
        
//        searchBar.rx.text.orEmpty
//            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .map{ query in
//                self.tableViewItems.value.filter { Food in
//                    query.isEmpty || Food.name.lowercased().contains(query.lowercased())
//                }
//            }.bind(to: tableview
//                .rx
//                .items(cellIdentifier: cellId)){tv,tableViewItem,cell in
//
//                    cell.textLabel?.text = tableViewItem.name
//                    cell.imageView?.image = UIImage.init(named: tableViewItem.imageNmae)
//                }
//                .disposed(by: disposeBag)
        
//        let foodQuery = searchBar.rx.text.orEmpty
//            .throttle(.microseconds(100), scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .map { query in
//
//
//
//                self.tableViewSections.value.map { sectionModel in
//
////                    SectionModel(header: sectionModel.header, items: sectionModel.items.fl)
//
////                    SectionModel(header:sectionModel.header, items:sectionModel.items.fliter({ food in
////                        let result = query.isEmpty || food.name.lowercased().contains(query.lowercased())
////                        return result
//////                        query.isEmpty || food.name.lowercased().contains(query.lowercased())
////                    }))
//
//
//                }
//            }.bind(to: tableview
//
//                .rx.items(dataSource: dataSource)
//            ).disposed(by: disposeBag)
        
//        Instance method 'items(dataSource:)' requires that 'TableViewSectionedDataSource<SecctionModel>' conform to 'RxTableViewDataSourceType'
        
//        RxTableViewDataSourceType
        
        
//        bind(to: tableview
//                .rx
//                .items(dataSource: dataSource
//                }
//                .disposed(by: disposeBag)
        
        
        
        
        
        
        
        
        tableview.rx.modelSelected(String.self).subscribe {[weak self] item in
            
            if let item = item.element{
                print(item)
                self?.pushToDetailVC(item)
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
    
    func pushToDetailVC(_ imageName:String){
        let detailVC = ProductDetailVC()
        self.navigationController?.pushViewController(detailVC, animated: true)
//        detailVC.imageName = imageName
        detailVC.imageNameRX.accept(imageName)
    }
    
    

}
