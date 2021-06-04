//
//  CountriesAndCapitalViewModel.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import Foundation

protocol CountriesViewModelInput {
    func getCountries()
}

protocol CountriesViewModelOutput {
    var countries   : Observable<[Country]> { get }
    var error       : Observable<String> { get }
}

final class CountriesAndCapitalViewModel: CountriesViewModelInput, CountriesViewModelOutput {

    private let useCase : CountriesUseCase?
    let countries       : Observable<[Country]> = Observable([])
    let error           : Observable<String> = Observable("")
    
    init(useCase: CountriesUseCase) {
        self.useCase = useCase
    }
    
    func getCountries() {
        useCase?.execute(completion: { result in
            switch result {
            case .success(let response):
                self.countries.value = response
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        })
    }
    
}
