//
//  ViewController.swift
//  RandomImageApp
//
//  Created by asong on 2022/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImageTableViewCell else{ return UITableViewCell() }
        cell.randomImageView.setImageWithUrl("https://picsum.photos/640/360/?random", indexPath.row)
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
    func setImageWithUrl(_ url: String, _ cacheKeyNumber: Int){
        let cacheKey = NSString(string: String(cacheKeyNumber))
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey){
            self.image = cachedImage
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: url) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let _ = error {
                        print("url image download error happened")
                        DispatchQueue.main.async {
                            self.image = UIImage(named: "default")
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data) {
                            ImageCacheManager.shared.setObject(image, forKey: cacheKey)
                            self.image = image
                        }
                    }
                }.resume()
            }
        }
    }
}

