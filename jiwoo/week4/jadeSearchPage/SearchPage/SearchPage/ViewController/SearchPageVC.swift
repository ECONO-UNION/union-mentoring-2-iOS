//
//  SearchPageVC.swift
//  SearchPage
//
//  Created by 황지우 on 2022/04/02.
//

import UIKit

class SearchPageVC: UIViewController, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //UICollectionViewDataSource
    
    var searchTermList : [String] = ["누룽지","바보","사랑","라면","포켓몬빵","배고프다","김치만두","우동"]
    
    func ListInfo (at index : Int) -> String {
        return searchTermDataList[index].title
    
    }
    
    var searchTermDataList : [SearchTermData] = [SearchTermData(title: "누룽지", isDeleteButtonPressed: false),SearchTermData(title: "바보", isDeleteButtonPressed: false),SearchTermData(title: "사랑", isDeleteButtonPressed: false),SearchTermData(title: "라면", isDeleteButtonPressed: false),SearchTermData(title: "포켓몬빵", isDeleteButtonPressed: false),SearchTermData(title: "배고파", isDeleteButtonPressed: false),SearchTermData(title: "김치만두", isDeleteButtonPressed: false),SearchTermData(title: "우동", isDeleteButtonPressed: false)]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchTermDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchTermCell", for: indexPath) as? SearchTermCell else {return UICollectionViewCell()}
        // 만약 해당 셀에 있는 엑스버튼 눌리면 해당 셀 사라지기
//        if searchTermDataList[indexPath.item].isDeleteButtonPressed == true {
//            searchTermDataList.remove(at: indexPath.item)
//        }
        let cellData = ListInfo(at: indexPath.item)
        cell.updateCell(data: cellData)
      
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let itemSpacing : CGFloat = 10
        let width:CGFloat = searchTermDataList[indexPath.item].title.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 50
        let height:CGFloat = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
      
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 

}

class SearchTermCell : UICollectionViewCell{
    
    @IBOutlet weak var searchTermLabel: UILabel!
    @IBAction func dissmissButtonPressed(_ sender: IndexPath) {
        
        
    }
    func updateCell (data : String) {
        searchTermLabel.text = data
        searchTermLabel.sizeToFit()
    }
}


struct SearchTermData {
    var title : String
    var isDeleteButtonPressed : Bool = false
    
    init (title : String, isDeleteButtonPressed : Bool) {
        self.title = title
        self.isDeleteButtonPressed  = isDeleteButtonPressed
    }
}


