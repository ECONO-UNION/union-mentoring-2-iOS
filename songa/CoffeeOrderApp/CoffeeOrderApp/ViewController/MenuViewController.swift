//
//  MenuOrderViewController.swift
//  CoffeeOrderApp
//
//  Created by asong on 2022/02/24.
//

import UIKit

class MenuViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardMoneyLabel: UILabel!
    
    var card: Card = Card(money: 0)
    var menuList: [Menu] = []
    var favoriteMenu: [Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setMenuList()
        cardMoneyLabel.text = "\(card.money)원"
    }
    
    func setMenuList(){
        menuList.append(Frappuccino())
        menuList.append(HotChoco())
        menuList.append(StrawberryCake())
        menuList.append(ChocoCake())
        menuList.append(Americano())
        menuList.append(VanillaLatte())
    }
    
    func order(menu: Menu, quantity: Int){
        if menu.stock < quantity {
            print("이 메뉴는 현재 재고가 부족합니다.")
            return
        }
        
        if (menu.price * quantity) > card.money {
            print("카드에 금액이 부족합니다.")
            return
        }
        card.money -= menu.price
    }
    
    func checkOrderAvailableMenu(){
        var orderAvailableMenuName: String = ""
        for i in 0..<menuList.count{
            if menuList[i].price < card.money {
                orderAvailableMenuName += menuList[i].name + " "
            }
        }
        print("현재 금액으로 주문할 수 있는 메뉴는 \(orderAvailableMenuName)입니다.")
    }
    
    func addFavoriteMenu(menu: Menu){
        favoriteMenu.append(menu)
    }
    
    func showFavoriteMenuList(){
        var favoriteMenuListStr: String = ""
        for i in 0..<favoriteMenu.count{
            favoriteMenuListStr += favoriteMenu[i].name + " "
        }
        print("즐겨찾기 목록 : \(favoriteMenuListStr)")
    }
    
    @IBAction func touchChargeButton(){
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardChargeVC") as? CardChargeViewController else {
            return
        }
        vc.completionHandler = { [weak self] money in
            guard let self = self else{ return }
            self.card.money += money
            self.cardMoneyLabel.text = "\(self.card.money)원"
        }
        self.present(vc, animated: true, completion: nil)
    }
}
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                MenuCell else {
                    return UICollectionViewCell()
                }
        cell.initCell(name: menuList[indexPath.row].name, price: menuList[indexPath.row].price)
        return cell
    }
    
    func setCollectionView(){
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 5 // 가로에서 cell과 cell 사이의 거리
        let width: CGFloat = (collectionView.bounds.width)/2 - itemSpacing // 셀 하나의 너비
        let height: CGFloat = width * 10/7 //셀 하나의 높이
        flowLayout.itemSize = CGSize(width: width, height: height)
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderVC") as? OrderViewController else {
            return
        }
        vc.name = menuList[indexPath.row].name
        vc.price = menuList[indexPath.row].price
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension MenuViewController: OrderDelegate {
    func sendOrderMoney(_ money: Int) {
        self.card.money -= money
        self.cardMoneyLabel.text = "\(self.card.money)원"
    }
}
