//
//  UserViewController.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import UIKit
import Combine

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: IProductViewModel?
    private var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAccessibilityIdentifier()
        bindViewModel()
        fetchProducts()
    }
}

extension UserViewController: Alertable {
    private func bindViewModel() {
        viewModel?.status.sink(receiveValue: { [weak self] status in
            guard let strongSelf = self else {return}
            switch status {
            case .none:
                print("Nothing happening")
            case .loading:
                print("Started Loading")
            case .success:
                print("Received Success")
                strongSelf.tableView.reloadData()
            case .failed(let message):
                print("Failed")
                strongSelf.showAlert(message: message, on: strongSelf)
            }
        }).store(in: &subscriptions)
    }
    
    private func fetchProducts() {
        viewModel?.fetchProducts()
    }
    
    private func addAccessibilityIdentifier() {
        tableView.accessibilityIdentifier = "table-Users"
    }
}
