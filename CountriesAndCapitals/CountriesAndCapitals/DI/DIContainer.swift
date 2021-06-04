//
//  DIContainer.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import Foundation

final class DIContainer {
    
    // If app had multiple modules that was needed, would be injected here as 'Module Dependency'
    
    init() {
    }
    
    // MARK: - Repositories
    
    func makeCountriesRepository() -> CountryRepository {
        return CountryRepository()
    }
    
    // MARK: - Use Cases
    func makeCountriesUseCase() -> CountriesUseCase {
        return MainCountiesUseCase(repository: makeCountriesRepository())
    }
    
    // MARK:- View Controllers
    
    func makeCountriesViewController() -> CountriesAndCapitalsViewController {
        let vc = CountriesAndCapitalsViewController(viewModel: makeCountriesAndCapitalViewModel())
        return vc
    }
    
    // MARK:- View Model
    
    func makeCountriesAndCapitalViewModel() -> CountriesAndCapitalViewModel {
        return CountriesAndCapitalViewModel(useCase: makeCountriesUseCase())
    }
    
}
