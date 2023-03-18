//
//  SpaceTableViewController.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 15.03.2023.
//

import UIKit

class SpaceTableViewController: UITableViewController {
    
    private var dataSpace: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        fetchSpace()
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSpace.count
        }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SpaceCellTableViewCell else { return UITableViewCell()}
        
        let spaceInfo = dataSpace[indexPath.row]
        cell.configur(with: spaceInfo)
        
        return cell
         
        }
    }



extension SpaceTableViewController {
    private func fetchSpace() {
        NetworkManager.shared.fetch(from: Link.urlSpace.rawValue) { [weak self] result in
            switch result {
            case .success(let space):
                self?.dataSpace = space.photos
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
    
