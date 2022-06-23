//
//  Root.swift
//  MVVMJsonParse
//
//  Created by Ruslan Sadritdinov on 23.06.2022.
//

import Foundation

// MARK: - Root
struct Root: Decodable {
    let data: [Datum]
    let view: [String]
}

// MARK: - Datum
struct Datum: Decodable {
    let name: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant
struct Variant: Decodable {
    let id: Int
    let text: String
}
