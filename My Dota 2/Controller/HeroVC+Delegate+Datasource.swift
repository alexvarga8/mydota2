//
//  HeroVC+Delegate+Datasource.swift
//  My Dota 2
//
//  Created by Alexandru Varga on 25/10/2019.
//  Copyright © 2019 Alexandru Varga. All rights reserved.
//

import UIKit

var heroLoadingSpinner: UIView?

extension HeroVC: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    //MARK : - Collection View Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentHeroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as! HeroCollectionViewCell
        cell.hero = currentHeroes[indexPath.row]
        
        return cell
        
    }
    
    //MARK: - Collection View Delegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "HeroDetailSegue" {
            if let dest = segue.destination as? HeroDetailVC, let index = collectionView.indexPathsForSelectedItems?.first {
                dest.image = currentHeroes[index.row].heroPhoto
                dest.name = currentHeroes[index.row].heroName
                dest.attribute = currentHeroes[index.row].primaryAttribute
                dest.attackType = currentHeroes[index.row].attackType
                dest.intelligenceGain = currentHeroes[index.row].intelligenceGain
                dest.intelligenceBase = currentHeroes[index.row].intelligenceBase
                dest.agilityBase = currentHeroes[index.row].agilityBase
                dest.agilityGain = currentHeroes[index.row].agilityGain
                dest.strengthGain = currentHeroes[index.row].strengthGain
                dest.strengthBase = currentHeroes[index.row].strengthBase
                dest.startingDamageMin = currentHeroes[index.row].startingDamageMin
                dest.startingDamageMax = currentHeroes[index.row].startingDamageMax
                dest.moveSpeed = currentHeroes[index.row].moveSpeed
                dest.startingArmor = currentHeroes[index.row].startingArmor
                dest.bio = currentHeroes[index.row].bio
            }
        }
        
    }
    
    //MARK: - Search Bar
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeroHeader", for: indexPath)
            
            return headerView
        }
        
        return UICollectionReusableView()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        currentHeroes = heroData.filter({ hero -> Bool in
            
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty {
                    return true
                }
                return hero.heroName.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty {
                    return hero.primaryAttribute == "agi"
                }
                return hero.heroName.lowercased().contains(searchText.lowercased()) && hero.primaryAttribute == "agi"
            case 2:
                if searchText.isEmpty {
                    return hero.primaryAttribute == "str"
                }
                return hero.heroName.lowercased().contains(searchText.lowercased()) && hero.primaryAttribute == "str"
            case 3:
                if searchText.isEmpty {
                    return hero.primaryAttribute == "int"
                }
                return hero.heroName.lowercased().contains(searchText.lowercased()) && hero.primaryAttribute == "int"
            default:
                return false
            }
        
        })
        
        collectionView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        switch selectedScope {
        case 0:
            currentHeroes = heroData
        case 1:
            currentHeroes = heroData.filter({ hero -> Bool in
                hero.primaryAttribute == "agi"
            })
        case 2:
            currentHeroes = heroData.filter({ hero -> Bool in
                hero.primaryAttribute == "str"
            })
        case 3:
            currentHeroes = heroData.filter({ hero -> Bool in
                hero.primaryAttribute == "int"
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
        
        heroLoadingSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            heroLoadingSpinner?.removeFromSuperview()
            heroLoadingSpinner = nil
        }
    }
    
}
