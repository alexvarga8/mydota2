//
//  ItemVC+Delegate+Datasource.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 25/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit

var itemLoadingSpinner: UIView?

extension ItemVC: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    //MARK:- Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentDotaItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        cell.dotaItem = currentDotaItems[indexPath.row]
        
        return cell
        
    }
    
    //MARK:- Collection View Delegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ItemDetailSegue" {
            if let dest = segue.destination as? ItemDetailVC,
                let index = collectionView.indexPathsForSelectedItems?.first {
                
                dest.image = currentDotaItems[index.row].itemPhoto
                dest.name = currentDotaItems[index.row].itemName
                dest.itemDescritpion = currentDotaItems[index.row].itemDescription
                dest.needsComponents = currentDotaItems[index.row].needsComponents
                dest.costs = currentDotaItems[index.row].itemCosts
                
            }
        }
        
    }
    
    //MARK:- Search Bar
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ItemHeader", for: indexPath)
            
            return headerView
        }
        
        return UICollectionReusableView()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        currentDotaItems = dotaItemData.filter({ dotaItem -> Bool in
            
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty {
                    return true
                }
                return dotaItem.itemName.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty {
                    return dotaItem.needsComponents == false
                }
                return dotaItem.itemName.lowercased().contains(searchText.lowercased()) && dotaItem.needsComponents == false
            case 2:
                if searchText.isEmpty {
                    return dotaItem.needsComponents == true
                }
                return dotaItem.itemName.lowercased().contains(searchText.lowercased()) && dotaItem.needsComponents == true
            default:
                return false
            }
            
        })
        
        collectionView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            currentDotaItems = dotaItemData
        case 1:
            currentDotaItems = dotaItemData.filter({ dotaItem -> Bool in
                dotaItem.needsComponents == false
            })
        case 2:
            currentDotaItems = dotaItemData.filter({ dotaItem -> Bool in
                dotaItem.needsComponents == true
            })
        default:
            break
        }
        collectionView.reloadData()
        
    }
    
    //MARK: - Loading Spinner
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        itemLoadingSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            itemLoadingSpinner?.removeFromSuperview()
            itemLoadingSpinner = nil
        }
    }
    
}
