//
//  SubscriptionsViewController.swift
//  Echoscribe
//
//  Created by Vladislav Len on 04.12.2021.
//

import UIKit

protocol SubscriptionsViewProtocol: AnyObject {}

final class SubscriptionsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var presenter: SubscriptionsPresenterProtocol?
    
    // MARK: - Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SubscriptionsItemCell.self, forCellReuseIdentifier: SubscriptionsItemCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - UIViewController Lifecycle
    
    override func loadView() {
        super.loadView()
        configureViews()
    }
    
    // MARK: - View Configuration
    
    private func configureViews() {
        configureRootView()
        configureNavigationItem()
        configureTableView()
    }
    
    private func configureRootView() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func configureNavigationItem() {
        self.navigationItem.title = "Подписки"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor
                .constraint(equalTo: self.view.leadingAnchor),
            tableView.topAnchor
                .constraint(equalTo: self.view.topAnchor),
            tableView.trailingAnchor
                .constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor
                .constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}

// MARK: - SubscriptionsViewProtocol

extension SubscriptionsViewController: SubscriptionsViewProtocol {}

extension SubscriptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionsItemCell.reuseIdentifier) else { return UITableViewCell() }
        
        return cell
    }
}

extension SubscriptionsViewController: UITableViewDelegate {}
