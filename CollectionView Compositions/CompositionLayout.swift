//
//  CompositionLayout.swift
//  CollectionView Compositions
//
//  Created by Vivek on 16/08/22.
//

import UIKit

enum compositionalGroupAlignment {
    case horizontal
    case vertical
}

struct CompositionLayout {
    
    static func createItem(width : NSCollectionLayoutDimension, height : NSCollectionLayoutDimension, spacing : CGFloat ) -> NSCollectionLayoutItem {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    static func createGroup(alignment : compositionalGroupAlignment,
                           width : NSCollectionLayoutDimension,
                            height : NSCollectionLayoutDimension,
                            items : [NSCollectionLayoutItem]
                            ) -> NSCollectionLayoutGroup {
       
        switch alignment {
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)

        case  .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)

        }
        
    }
    
    static func createGroup(alignment : compositionalGroupAlignment,
                           width : NSCollectionLayoutDimension,
                            height : NSCollectionLayoutDimension,
                            item : NSCollectionLayoutItem,
                            count : Int) -> NSCollectionLayoutGroup {
       
        switch alignment {
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
        case  .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
            
        }
        
    }
    
}
