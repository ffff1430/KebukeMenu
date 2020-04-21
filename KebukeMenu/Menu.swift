//
//  Menu.swift
//  KebukeMenu
//
//  Created by star on 2020/4/14.
//  Copyright © 2020 star. All rights reserved.
//

import Foundation

let url = URL(string: "https://sheetdb.io/api/v1/khxco4ags8259")
var urlRequest = URLRequest(url:url!)


struct teaType {
   var Image:String?
   var teaName:String?
    var price:String?
}

let tea = [teaType(Image: "tea1", teaName: "熟成紅茶", price: "30"),
teaType(Image: "tea2", teaName: "麗春紅茶", price: "30"),
teaType(Image: "tea3", teaName: "太妃紅茶", price: "35"),
teaType(Image: "tea4", teaName: "熟成冷露", price: "35"),
teaType(Image: "tea5", teaName: "雪花冷露", price: "30"),
teaType(Image: "tea6", teaName: "春芽冷露", price: "30"),
teaType(Image: "tea7", teaName: "春芽綠茶", price: "30"),
teaType(Image: "tea8", teaName: "春梅冰茶", price: "40"),
teaType(Image: "tea9", teaName: "冷露歐蕾", price: "45"),
teaType(Image: "tea10", teaName: "熟成歐蕾", price: "45"),
teaType(Image: "tea11", teaName: "白玉歐蕾", price: "55"),
teaType(Image: "tea12", teaName: "熟成檸果", price: "55"),
teaType(Image: "", teaName: "胭脂紅茶", price: "35"),
]

struct OrderList: Codable {
    var name:String
    var teaName:String
    var suger:String
    var Ice:String
    var size:String
    var Boba:String
    var price:Int
}
