//
//  MainViewController.swift
//  TestSapsan
//
//  Created by Дмитрий Дуров on 15.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Приложение платное"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitle: UILabel = {
        let subtitle = UILabel()
        subtitle.text = "Выберите удобный для вас способ оплаты"
        subtitle.numberOfLines = 0
        subtitle.font = .systemFont(ofSize: 18)
        subtitle.textAlignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    private let selectionViewOne: SelectionView = {
        let selectionViewOne = SelectionView()
        selectionViewOne.period.text = "6 месяцев"
        selectionViewOne.price.text = "1990 руб."
        selectionViewOne.tarifDescriprion.text = "Пробный период три дня, бесплатная отмена"
        selectionViewOne.choiceImageView.isHidden = false
        selectionViewOne.choiceImageView.image = UIImage(named: "Path")
        selectionViewOne.backgroundColor = UIColor(red: 0.142, green: 0.85, blue: 0.468, alpha: 1)
        selectionViewOne.tarifDescriprion.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return selectionViewOne
    }()
    
    private let selectionViewTwo: SelectionView = {
        let selectionViewTwo = SelectionView()
        selectionViewTwo.period.text = "1 месяц"
        selectionViewTwo.price.text = "499 руб."
        selectionViewTwo.tarifDescriprion.text = "Ежемесячная подписка"
        return selectionViewTwo
    }()
    
    private let selectionViewThree: SelectionView = {
        let selectionViewThree = SelectionView()
        selectionViewThree.period.text = "Навсегда"
        selectionViewThree.price.text = "4990 руб."
        selectionViewThree.tarifDescriprion.text = "Один платеж"
        return selectionViewThree
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(selectionViewOne)
        stackView.addArrangedSubview(selectionViewTwo)
        stackView.addArrangedSubview(selectionViewThree)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var payButton: PayButton = {
        let payButton = PayButton(type: .system)
        payButton.setTitle("Оформить подписку", for: .normal)
        payButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        return payButton
    }()
    
    private lazy var restorePurchaseButton: UIButton = {
        let restorePurchaseButton = UIButton(type: .system)
        restorePurchaseButton.setTitle("Восстановить покупки", for: .normal)
        restorePurchaseButton.tintColor = UIColor(red: 0.6, green: 0.635, blue: 0.678, alpha: 1)
        restorePurchaseButton.translatesAutoresizingMaskIntoConstraints = false
        return restorePurchaseButton
    }()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        addSubview(view: stackView, mainTitle, subTitle, payButton, restorePurchaseButton)
        setConstraints()
    }
    
    // MARK: - Private methods
    
    private func addSubview(view: UIView...) {
        view.forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setAppearance() {
        view.backgroundColor = .white
    }
    
    @objc private func payButtonTapped() {
        payButton.showLoading()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainTitle.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 76),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(lessThanOrEqualTo: subTitle.bottomAnchor, constant: 48),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            payButton.bottomAnchor.constraint(lessThanOrEqualTo: restorePurchaseButton.topAnchor, constant: -25),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            
            restorePurchaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            restorePurchaseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            restorePurchaseButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -60),
            restorePurchaseButton.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
}

