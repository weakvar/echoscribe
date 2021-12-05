//
//  SubscriptionsItemCell.swift
//  Echoscribe
//
//  Created by Vladislav Len on 05.12.2021.
//

import UIKit

final class SubscriptionsItemCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "SubscriptionsItemCell"
    
    // MARK: - Views
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: Remove this hardcode
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: Remove this hardcode
        label.text = "Netflix"
        
        return label
    }()
    
    private lazy var paymentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.text = "Next Withdrawal".localized()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var paymentDateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // TODO: Remove this hardcode
        label.text = "18 декабря 2021"
        
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, paymentLabelsStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var paymentLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [paymentDescriptionLabel, paymentDateLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureViews()
    }
    
    // MARK: - UITableViewCell Lifecycle
    
    override func prepareForReuse() {
        // TODO: Implement this method
    }
    
    // MARK: - View Configuration
    
    private func configureViews() {
        configureAccessoryView()
        configureSelectedBackgroundView()
        configureLogoImageView()
        configureLabelsStackView()
    }
    
    private func configureAccessoryView() {
        let accessoryImage = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))
        let accessoryImageView = UIImageView(image: accessoryImage)
        accessoryImageView.tintColor = .tertiaryLabel
        
        self.accessoryView = accessoryImageView
    }
    
    private func configureSelectedBackgroundView() {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        
        self.selectedBackgroundView = view
    }
    
    private func configureLogoImageView() {
        self.contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor
                .constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            logoImageView.centerYAnchor
                .constraint(equalTo: self.contentView.centerYAnchor),
            logoImageView.widthAnchor
                .constraint(equalToConstant: 48),
            logoImageView.heightAnchor
                .constraint(equalToConstant: 48)
        ])
    }
    
    private func configureLabelsStackView() {
        self.contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor
                .constraint(greaterThanOrEqualToConstant: 22),
            paymentDescriptionLabel.heightAnchor
                .constraint(greaterThanOrEqualToConstant: 20),
            paymentDateLabel.heightAnchor
                .constraint(greaterThanOrEqualToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor
                .constraint(equalTo: logoImageView.trailingAnchor, constant: 16),
            labelsStackView.topAnchor
                .constraint(equalTo: self.contentView.topAnchor, constant: 8),
            labelsStackView.trailingAnchor
                .constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor
                .constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
