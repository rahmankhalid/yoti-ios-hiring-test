//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//


import UIKit

public final class CountriesShareView {
    
    var view            : UIView!
    var collectionView  : UICollectionView!
    
    init(view: UIView) {
        self.view = view
        view.backgroundColor = .systemBackground
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createOneColumFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor          = .clear
        collectionView.allowsMultipleSelection  = true
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.register(CountriesCollCell.self, forCellWithReuseIdentifier: CountriesCollCell.identifier)
    
    }
    
    // MARK:- Helper
    
    // Can be made moved to a helper class with a variety of flow layouts.
    public func createOneColumFlowLayout() -> UICollectionViewFlowLayout {
        let padding             : CGFloat = 30
        let flowLayout          = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 10, right: padding)
        flowLayout.itemSize     = CGSize(width: UIScreen.main.bounds.width,
                                         height: 80)

        return flowLayout
    }
    
}
