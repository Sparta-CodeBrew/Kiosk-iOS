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

let coffeMenu: [MenuList] = [MenuList(menuImage: "americano", menuName: "아메리카노",menuPrice: 4000),MenuList(menuImage: "cafelatte", menuName: "카페라떼",menuPrice: 4500),MenuList(menuImage: "cappuccino", menuName: "카푸치노",menuPrice: 4500),MenuList(menuImage: "dolcelatte", menuName: "돌체라떼",menuPrice: 5000),MenuList(menuImage: "chocolatesmoothie", menuName: "초코스무디",menuPrice: 5500),MenuList(menuImage: "mangosmoothie", menuName: "망고스무디",menuPrice: 6000),MenuList(menuImage: "strawberrysmoothie", menuName: "딸기스무기",menuPrice: 6000),MenuList(menuImage: "vanillabeanlatte", menuName: "바닐라빈라떼",menuPrice: 6000)]
let frappuccino : [MenuList] = [MenuList(menuImage: "espresso", menuName: "에스프레소", menuPrice: 4500),MenuList(menuImage: "Java chips", menuName: "자바 칩", menuPrice: 4500),MenuList(menuImage: "Caramel", menuName: "카라멜", menuPrice: 4500),MenuList(menuImage: "chocolate cream", menuName: "초콜릿 크림", menuPrice: 5000),MenuList(menuImage: "Jeju camouflage", menuName: "제주까망", menuPrice: 6000),MenuList(menuImage: "Jeju mugwort rice cake", menuName: "제주 쑥떡 크림", menuPrice: 5000),MenuList(menuImage: "Jeju Organic Matcha", menuName: "제주 유기농 말차 크림", menuPrice: 500),MenuList(menuImage: "Pistachio", menuName: "피스타치오", menuPrice: 5500),MenuList(menuImage: "White Tiger", menuName: "화이트 타이거", menuPrice: 6000),MenuList(menuImage: "White chocolate", menuName: "화이트 초콜릿", menuPrice: 6500)]
let blended : [MenuList] = [MenuList(menuImage: "Cotton Sky Yogurt Blended", menuName: "코튼 스카이 요거트", menuPrice: 5500),MenuList(menuImage: "Mango and banana blended", menuName: "망고 바나나 블렌디드", menuPrice: 5500),MenuList(menuImage: "Mango Fashion Tea Blended", menuName: "망고 패션 티 블렌디드", menuPrice: 6500),MenuList(menuImage: "North Korean lemon Earl Grey Blended", menuName: "북한산 레몬 얼 그레이", menuPrice: 6000),MenuList(menuImage: "Peach yogurt blended", menuName: "피치 요거트 블렌디드", menuPrice: 7500),MenuList(menuImage: "Starbucks Classic Milk Tea Blended", menuName: "스타벅스 클래식 밀크티", menuPrice: 7000),MenuList(menuImage: "Strawberry Delight Yogurt Blended", menuName: "딸기 딜라이트 요거트", menuPrice: 8500),MenuList(menuImage: "The Green Mugwort Blended", menuName: "더 그린 쑥 블렌디드", menuPrice: 7800),MenuList(menuImage: "Yeosu sea citron blended", menuName: "여수 바다 유자 블렌디드", menuPrice: 6000)]
let coleBrew : [MenuList] = [MenuList(menuImage: "Dolce Cold Brew", menuName: "돌체 콜드 브루", menuPrice: 5500),MenuList(menuImage: "Mint cold brew", menuName: "민트 콜드 브루", menuPrice: 6500),MenuList(menuImage: "Night Cold Brew", menuName: "나이트로 콜드 브루", menuPrice: 7500),MenuList(menuImage: "Nitro vanilla cream", menuName: "나이트로 바닐라 크림", menuPrice: 7000),MenuList(menuImage: "Reserve Cold Brew", menuName: "리저브 콜드 브루", menuPrice: 6000),MenuList(menuImage: "Reserve Night", menuName: "리저브 나이트로", menuPrice: 7800),MenuList(menuImage: "Signature The Black Cold Brew", menuName: "시그니처 더 블랙", menuPrice: 9000),MenuList(menuImage: "Vanilla cream cold brew", menuName: "바닐라 크림 콜드 브루", menuPrice: 8000)]
