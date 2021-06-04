//
//  CountriesResponse.swift
//  CountriesAndCapitals
//
//  Created by Khalid Rahman on 04/06/2021.
//  Copyright © 2021 Yoti Ltd. All rights reserved.
//

import Foundation

struct CountryReponse: Codable {
    let name    : String
    let capital : String
}

extension CountryReponse {
    func toDomain() -> Country { return .init(name: name, capital: capital) }
}
