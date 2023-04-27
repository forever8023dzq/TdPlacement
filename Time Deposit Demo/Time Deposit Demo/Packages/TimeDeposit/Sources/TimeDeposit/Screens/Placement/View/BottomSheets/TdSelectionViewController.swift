//
//  TdSelectionViewController.swift
//  
//
//  Created by Apple on 2023/4/23.
//

import UIKit

class TdSelectionViewController: XBottomSheetController {
    var viewModel: PlacementEntryViewModel!
    var accounts: [TDAccount]! {
        didSet { reload() }
    }
    
    let identifiers = XAccessibilityIdentifier.EarlyWithdrawal.Form.AccountSelection.self
    let accountListTableView = UITableView()
    
    // MARK: UI Elements
    lazy var topNotch: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = identifiers.topNotch
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.886, green: 0.906, blue: 0.925, alpha: 1)
        view.corners(2)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = identifiers.titleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select your SGD Time Deposit account"
        label.textColor = TextStyle.OpenSans_Bold_20_Header.color
        label.font = TextStyle.OpenSans_Bold_20_Header.font
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    public init(viewModel: PlacementEntryViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountListTableView.delegate = self
        accountListTableView.dataSource = self
        accountListTableView.backgroundColor = .white
        setupView()
    }
    
    func reload() {
        accountListTableView.reloadData()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(topNotch)
        view.addSubview(titleLabel)
        view.addSubview(accountListTableView)
        setLayoutConstraints()
        
        accountListTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        accountListTableView.register(TdTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setLayoutConstraints() {
        topNotch.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        accountListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topNotch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNotch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topNotch.heightAnchor.constraint(equalToConstant: 4),
            topNotch.widthAnchor.constraint(equalToConstant: 48),
            
            titleLabel.topAnchor.constraint(equalTo: topNotch.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            accountListTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            accountListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            accountListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            accountListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

extension TdSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.toAccounts.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TdTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TdTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        let rowItem = viewModel.toAccounts.value[indexPath.row]
        let selectAccId = viewModel.toAccount.value?.account.accTokenId
        cell.fill(with: rowItem)
        if rowItem.account.accTokenId == selectAccId {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTd = viewModel.toAccounts.value[indexPath.row]
        viewModel.updateSelectedTdAccount(account: selectedTd)
        self.dismiss(animated: true)
    }
}
