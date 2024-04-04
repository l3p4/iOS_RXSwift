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
        print("TestTimerDeinitVC deinit")
        timer?.invalidate()
    }
    
    lazy var timer:Timer = {
//        var timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(testTimer(timer:)), userInfo: nil, repeats: true)
        var timer:Timer? = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {[weak self] timer in
//            print(222)
            self?.testTimer(timer: timer)
        })
        RunLoop.main.add(timer, forMode: .default)
        return timer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        self.timer.fire()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timer.invalidate()
    }
    
    @objc func testTimer(timer:Timer)  {
         print(111)
     }
}
