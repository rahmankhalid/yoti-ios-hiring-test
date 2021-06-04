//
//  CountriesCollCell.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import UIKit

final public class CountriesCollCell: UICollectionViewCell {
    
    private let bg              = UIView(frame: .zero)
    private let countryLbl      = UILabel(frame: .zero)
    private let capitalLbl      = UILabel(frame: .zero)
    
    private let margin          : CGFloat = 30
    private let lblMargin       : CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    var country: Country! {
        didSet {
            countryLbl.text = country?.name
            capitalLbl.text = country?.capital
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configureViews() {
        addBg()
        addCountryLbl()
        addCapitalLbl()
    }
    
    private func addBg() {
        addSubview(bg)
        bg.translatesAutoresizingMaskIntoConstraints = false
        
        bg.layer.cornerRadius            = 16
        bg.backgroundColor               = .secondarySystemBackground
        
        NSLayoutConstraint.activate([
            self.bg.topAnchor.constraint(equalTo: self.topAnchor),
            self.bg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            self.bg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
            self.bg.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func addCountryLbl() {
        bg.addSubview(countryLbl)
        countryLbl.translatesAutoresizingMaskIntoConstraints = false
        countryLbl.font         = UIFont.preferredFont(forTextStyle: .headline)
        countryLbl.textColor    = .label
        
        NSLayoutConstraint.activate([
            countryLbl.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            countryLbl.centerYAnchor.constraint(equalTo: bg.centerYAnchor, constant: -10),
            countryLbl.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: lblMargin),
            countryLbl.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -lblMargin)
        ])
    }
    
    private func addCapitalLbl() {
        bg.addSubview(capitalLbl)
        capitalLbl.translatesAutoresizingMaskIntoConstraints = false
        capitalLbl.font         = UIFont.preferredFont(forTextStyle: .body)
        capitalLbl.textColor    = .label
        
        NSLayoutConstraint.activate([
            capitalLbl.topAnchor.constraint(equalTo: countryLbl.bottomAnchor, constant: 0),
            capitalLbl.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: lblMargin),
            capitalLbl.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -lblMargin)
        ])
    }
    
}
