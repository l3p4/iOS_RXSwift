//
//  FoodSectionModel.swift
//  RxSwiftDemo
//
//  Created by simon on 2024/1/29.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources


struct SectionModel{
    var header:String 
    var items:[Food]
}

//extension SectionModel:SectionModelType{
//    init(original: SectionModel, items: [Food]) {
//        self = original
//        self.items = items
//    }
//}

extension SectionModel: SectionModelType{
    init(original: SectionModel, items: [Food]) {
        self = original
        self.items = items
    }
    
    
}
