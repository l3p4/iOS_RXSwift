//
//  ProductDetailVC.swift
//  RxSwiftDemo
//
//  Created by simon on 2024/1/28.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ProductDetailVC: UIViewController{
    
    let disposBag = DisposeBag()
    var imageNameRX:BehaviorRelay<String> = BehaviorRelay(value: "")
    
    var imageName:String?{
        didSet{
            if let imageN = imageName{
//                self.imageView.image = UIImage.init(named: imageN)
            }
        }
    }
    
    lazy var imageView = {
        let imageV = UIImageView()
        return imageV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(imageView)
        imageView.frame = CGRectMake(0, 100, CALength.kScreenWidth, 200)
        
        //RX
        imageNameRX.map { name in
            UIImage.init(named: name)
        }.bind(to: imageView.rx.image)
            .disposed(by: disposBag)
        
        
        
        var beRelay:BehaviorRelay = BehaviorRelay(value:1)
        beRelay.map { item in
            item * 2
        }.subscribe { elem in
            if let ele = elem.element{
                print(ele)
            }
        }.disposed(by: disposBag)
        
        beRelay.accept(3)
        
        
    }
}
