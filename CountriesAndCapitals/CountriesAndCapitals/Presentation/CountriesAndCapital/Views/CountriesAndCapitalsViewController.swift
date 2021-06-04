//
// Copyright © 2021 Yoti Ltd. All rights reserved.
//

import UIKit

class CountriesAndCapitalsViewController: UIViewController {
    
    enum Section { case main }
    var dataSource : UICollectionViewDiffableDataSource<Section, Country>!
    
    var shareView   : CountriesShareView!
    var viewModel   : CountriesAndCapitalViewModel!
    
    convenience init(viewModel: CountriesAndCapitalViewModel) {
        self.init()
        self.viewModel  = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareView = CountriesShareView(view: self.view)
        configureDataSource()
        viewModel.getCountries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind(to: viewModel)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.countries.remove(observer: self)
        viewModel.error.remove(observer: self)
        super.viewDidDisappear(animated)
    }
    
    //MARK:- ViewModel Helper
    
    private func bind(to viewModel: CountriesAndCapitalViewModel) {
        viewModel.countries.observe(on: self) { [weak self] countries in
            guard let self = self else { return }
            DispatchQueue.main.async { self.updateData(with: countries) }
        }
        
        viewModel.error.observe(on: self) { error in
            print(error)
        }
    }
    
}

extension CountriesAndCapitalsViewController {
    
    // MARK:- CollectionView Setup
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: shareView.collectionView, cellProvider: { (collectionView, indexPath, country) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountriesCollCell.identifier, for: indexPath) as! CountriesCollCell
            cell.country = country
            return cell
        })
    }
    
    // MARK:- DataSource Helper
    
    func updateData(with countries: [Country]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries)
        
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
}
