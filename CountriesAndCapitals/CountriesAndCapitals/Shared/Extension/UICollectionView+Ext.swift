//
//  UICollectionView+Ext.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import UIKit.UICollectionViewCell

public extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
