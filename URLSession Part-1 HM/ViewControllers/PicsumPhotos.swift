//
//  PicsumPhotos.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 16.03.2023.
//

import UIKit

class PicsumPhotos: UIViewController {

    
    @IBOutlet var picsumImage: UIImageView!
    
    @IBAction func buttonPressed(_ sender: Any) {
        
            NetworkManager.shared.fetchPicsumPhotos(from: Link.urlPicsumPhotos.rawValue) { [weak self] result in
                switch result {
                case .success(let picsumPhotoData):
                    self?.picsumImage.image = UIImage(data: picsumPhotoData)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
