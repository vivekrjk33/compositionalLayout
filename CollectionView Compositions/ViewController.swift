//
//  ViewController.swift
//  CollectionView Compositions
//
//  Created by Vivek on 10/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images : [UIImage] = Array( 1 ... 11 ).map{ UIImage(named: String($0))! }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.collectionViewLayout = createLayout()
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
                
        let item = CompositionLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
        
        let fullItem = CompositionLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 1)
        
        let verticalItem = CompositionLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: fullItem, count: 2)
        
        
  
        
        let horizontalGroup = CompositionLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.6), items: [item, verticalItem])
        
        let mainItem = CompositionLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.4), spacing: 1)
        
        let mainGroup = CompositionLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.6), items: [mainItem,horizontalGroup])
        

        let section = NSCollectionLayoutSection(group: mainGroup)
        

        return UICollectionViewCompositionalLayout(section: section)
        
        
    }


}


extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        cell.setUp(image: images[indexPath.row])
        return cell
    }
    
    
    
}
