//
//  TestTimerDeinitVC.swift
//  RxSwiftDemo
//
//  Created by Simon on 4/4/24.
//

import Foundation
import UIKit


class TestTimerDeinitVC:UIViewController{
    
    deinit{
        //deinit中记得销毁,如果有其他地方手动销毁也调用invalidate
        timer?.invalidate()
    }
    //1.定义一个可选类型的timer
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        //2.用闭包创建timer,并添加到defaultRunLoop中, self记得用weak
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {[weak self] timer in
                        self?.testTimer(timer: timer)
                    })
        
        if let timer1 = timer{
            RunLoop.main.add(timer1, forMode: .default)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timer?.invalidate()
    }
    
    @objc func testTimer(timer:Timer)  {
         print(111)
     }
}
