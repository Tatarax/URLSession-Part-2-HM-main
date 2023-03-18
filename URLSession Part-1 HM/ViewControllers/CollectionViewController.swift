//
//  CollectionViewController.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 28.02.2023.
//

import UIKit

    //MARK: - Private
private let reuseIdentifier = "cellButton"
private let reuseIdentifierPicsum = "showPicsumPhotos"
private let reuseIndentifierInfoSpace = "cell"

    //MARK: - Enum

enum ActionButton: String, CaseIterable {
    case buttonOne = "Show info space"
    case buttonTwo = "Show other photo"
   
}

final class CollectionViewController: UICollectionViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fetchImage()
    }
    
    //MARK: - Outlet
    @IBOutlet var imageView: UIImageView!
    
    let actionButton = ActionButton.allCases
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actionButton.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ActionLabel
        else {
            return UICollectionViewCell()
        }
        
        cell.actionButtonLabel.text = actionButton[indexPath.item].rawValue
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let actionButton = actionButton[indexPath.item]
        
        switch actionButton {
        case .buttonOne: performSegue(withIdentifier: reuseIndentifierInfoSpace, sender: nil)
        case.buttonTwo: performSegue(withIdentifier: reuseIdentifierPicsum, sender: nil)
        }
        
    }

    
   //MARK: - Private Alert
    private func succesAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Succesed",
                message: "You can see results in the debag aria",
                preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
        
    private func fieledAlert() {
            DispatchQueue.main.async {
                let alert = UIAlertController(
                    title: "Failed",
                    message: "You can error in the debag aria",
                    preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }

}

    //MARK: - Extension UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: UIScreen.main.bounds.width - 90 , height: 50)
    }
}

extension CollectionViewController {
   
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: Link.urlImage.rawValue) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
    
