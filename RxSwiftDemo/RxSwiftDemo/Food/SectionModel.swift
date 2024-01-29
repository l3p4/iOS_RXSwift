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


struct FoodSectionModel{
    var header:String 
    var items:[FoodModel]
}

extension FoodSectionModel:SectionModelType{
    init(original: FoodSectionModel, items: [FoodModel]) {
        self = original
        self.items = items
    }
}
