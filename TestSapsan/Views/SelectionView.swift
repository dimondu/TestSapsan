//
//  SelectionView.swift
//  TestSapsan
//
//  Created by Дмитрий Дуров on 15.02.2023.
//

import UIKit

final class SelectionView: UIView {
    
    // MARK: - Public properties
    
    let period: UILabel = {
        let period = UILabel()
        period.font = .systemFont(ofSize: 20, weight: .bold)
        period.textColor = .black
        return period
    }()
    
    let price: UILabel = {
        let price: UILabel = UILabel()
        price.textAlignment = .right
        price.font = .systemFont(ofSize: 24, weight: .bold)
        price.textColor = .black
        return price
    }()
    
    let tarifDescriprion: UILabel = {
        let description = UILabel()
        description.textAlignment = .left
        description.font = .systemFont(ofSize: 16)
        description.numberOfLines = 0
        description.textColor = UIColor(red: 0.427, green: 0.471, blue: 0.522, alpha: 1)
        return description
    }()
    
    let choiceImageView: UIImageView = {
        let choice = UIImageView()
        choice.frame = CGRect(x: 0, y: 0, width: 20, height: 16)
        choice.contentMode = .scaleAspectFit
        choice.isHidden = true
        return choice
    }()
    
    // MARK: - Private properties
    
    private let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 16
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        return stackView
    }()
    
    private let choiceAndPeriodStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - Override methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubview()
        setConstraints()
    }
    
    // MARK: - Initializers
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.9267371297, green: 0.9416677356, blue: 0.9543114305, alpha: 1)
    }
    
    private func addSubview() {
        choiceAndPeriodStackView.addArrangedSubview(choiceImageView)
        choiceAndPeriodStackView.addArrangedSubview(period)
        topStackView.addArrangedSubview(choiceAndPeriodStackView)
        topStackView.addArrangedSubview(price)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(tarifDescriprion)
        
        addSubview(mainStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 105),
            self.widthAnchor.constraint(equalToConstant: 340),
            
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
        ])
    }
}
