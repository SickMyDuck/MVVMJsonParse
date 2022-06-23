//
//  OptionsViewModel.swift
//  MVVMJsonParse
//
//  Created by Ruslan Sadritdinov on 23.06.2022.
//

import Foundation

struct OptionListViewModel {
    var options: Observable<[OptionTableViewCellViewModel]> = Observable([])
}

struct OptionTableViewCellViewModel {
    let name: String
}
