//
//  MenuListStruct.swift
//  CodeBrew
//
//  Created by t2023-m0039 on 12/28/23.
//

import Foundation

struct MenuList {
    var menuImage: String
    var menuName: String
    var menuPrice: Int
}

let sample: [MenuList] = [MenuList(menuImage: "americano", menuName: "아메리카노",menuPrice: 4000),MenuList(menuImage: "cafelatte", menuName: "카페라떼",menuPrice: 4500),MenuList(menuImage: "cappuccino", menuName: "카푸치노",menuPrice: 4500),MenuList(menuImage: "dolcelatte", menuName: "돌체라떼",menuPrice: 5000),MenuList(menuImage: "chocolatesmoothie", menuName: "초코스무디",menuPrice: 5500),MenuList(menuImage: "mangosmoothie", menuName: "망고스무디",menuPrice: 6000),MenuList(menuImage: "strawberrysmoothie", menuName: "딸기스무기",menuPrice: 6000),MenuList(menuImage: "vanillabeanlatte", menuName: "바닐라빈라떼",menuPrice: 6000)]
