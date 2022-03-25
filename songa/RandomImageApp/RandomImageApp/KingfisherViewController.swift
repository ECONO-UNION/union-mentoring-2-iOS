//
//  KingfisherViewController.swift
//  RandomImageApp
//
//  Created by asong on 2022/03/25.
//

import UIKit
import Kingfisher

class KingfisherViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension KingfisherViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageTableViewCell else{ return UITableViewCell() }
        cell.randomImageView.setImageWithKingfisher("https://picsum.photos/640/360/?random", indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
     
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
}
extension UIImageView{
    func setImageWithKingfisher(_ urlString: String, _ index: Int){
        let cachedKey = String(index)
        ImageCache.default.retrieveImage(forKey: cachedKey, options: nil) { result in
            switch result {
            case .success(let value):
                if let image = value.image {
                    self.image = image
                } else {
                    guard let url = URL(string: urlString) else { return }
                    let resource = ImageResource(downloadURL: url, cacheKey: cachedKey)
                    self.kf.setImage(with: resource)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
