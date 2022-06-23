//
//  ViewController.swift
//  MVVMJsonParse
//
//  Created by Ruslan Sadritdinov on 22.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = OptionListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        bindViewModel()

        
        fetchData()
    }
    
    func bindViewModel() {
        viewModel.options.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func fetchData() {
        let request = Alamofire.request(Constants.jsonURL)
        
        request.responseJSON { (response) in
            let decoder = JSONDecoder().self

            do {
                let rootJson = try decoder.decode(Root.self, from: response.data!)
                self.viewModel.options.value = rootJson.view.compactMap({
                    OptionTableViewCellViewModel(name: $0)
                })
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.options.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.options.value?[indexPath.row].name
        return cell
    }
    
    
}

