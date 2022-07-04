//
//  ProductViewController.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: IProductViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAccessibilityIdentifier()
        fetchProducts()
    }
}

extension ProductViewController: Alertable {
    
    private func fetchProducts() {
        viewModel?.fetchProducts()
    }
    
    private func addAccessibilityIdentifier() {
        tableView.accessibilityIdentifier = "table-Users"
    }
}

extension ProductViewController: ProductViewModelOutput {
    
    func success() {
        tableView.reloadData()
    }
    
    func gotError(_ error: String) {
        showAlert(message: error, on: self)
    }
    
}
