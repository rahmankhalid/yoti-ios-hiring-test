//
//  CountriesUseCase.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import Foundation

protocol CountriesUseCase {
    func execute(completion: @escaping (Result<[Country], Error>) -> Void)
}

final class MainCountiesUseCase: CountriesUseCase {
    
    private let repository: CountriesRepository
    
    init(repository: CountriesRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Country], Error>) -> Void) {
        repository.getCountries { result in
            switch result {
            case .success(let response) : completion(.success(response))
            case .failure(let error)    : completion(.failure(error))
            }
        }
    }
    
}
