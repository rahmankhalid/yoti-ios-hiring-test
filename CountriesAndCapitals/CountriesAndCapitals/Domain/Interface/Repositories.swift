//
//  Repositories.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

protocol CountriesRepository {
    func getCountries(completion: @escaping (Result<[Country], Error>) -> Void)
}
