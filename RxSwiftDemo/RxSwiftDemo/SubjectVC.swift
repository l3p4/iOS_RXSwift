//
//  SubjectVC.swift
//  RxSwiftDemo
//
//  Created by simon on 2024/1/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SubjectVC: UIViewController{
    let disBag = DisposeBag()
/*
 PublishSubject只会响应订阅后的信号
 BehaviorSubject会响应订阅前的信号-初始值
 ReplaySubject 会响应订阅前的信号-个数由bufferSize决定
 AsyncSubject  会响应订阅前/后 的最后一个信号,以及completd信号,必须执行onCompleted().
 
 PublishRelay: PublishRelay is a wrapper for `PublishSubject`.Unlike `PublishSubject` it can't terminate with error or completed. 是对PublishSubject的保证,但是不能以error or completed结束
 
 BehaviorRelay: a wrapper for `BehaviorSubject`.Unlike `BehaviorSubject` it can't terminate with error or completed.
 Relay不会发送错误或者已完成的信号,所以很适合UI的操作
 */
    let pubSub =  PublishSubject<Int>()
    let behSub = BehaviorSubject(value: 100)
    let replaySub = ReplaySubject<Int>.create(bufferSize: 3)
    let asyncSub = AsyncSubject<Int>.init()
    let pubRelay = PublishRelay<String>()
    let behRelay = BehaviorRelay(value: "BehaviorRelay-1")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        pubSub.subscribe { value in
            print(value)
        }.disposed(by: disBag)
        
        behSub.subscribe {
            print($0)
        }.disposed(by: disBag)
        
        replaySub.onNext(3)
        replaySub.onNext(4)
        replaySub.onNext(5)
        replaySub.onNext(6)
        replaySub.subscribe {
            print($0)
        }.disposed(by: disBag)
        
        asyncSub.onNext(10)
        asyncSub.onNext(11)
        asyncSub.subscribe {
            print($0)
        }.disposed(by: disBag)
        //next(11) completed
        asyncSub.onCompleted()
        
        pubRelay.accept("PublicRelay-1")
        pubRelay.accept("PublicRelay-2")
        pubRelay.subscribe { elem in
            print(elem)
        }.disposed(by: disBag)
        
        behRelay.accept("BehaviorRelay-2")
        behRelay.accept("BehaviorRelay-3")
        behRelay.subscribe { item in
            print(item)
        }.disposed(by: disBag)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        pubSub.onNext(1)
//        pubSub.onNext(2)
//
        behSub.onNext(200)
        behSub.onNext(300)
        
//        replaySub.onNext(7)
//        replaySub.onNext(8)
//        replaySub.onNext(9)
//        replaySub.onNext(0)
        
//        asyncSub.onCompleted()
//        asyncSub.onNext(12)
//        asyncSub.onNext(13)
//        asyncSub.onCompleted()
        
        pubRelay.accept("PublicRelay-3")
        pubRelay.accept("PublicRelay-4")
        
        behRelay.accept("BehaviorRelay-4")
        behRelay.accept("BehaviorRelay-5")
    }
    
    
}




