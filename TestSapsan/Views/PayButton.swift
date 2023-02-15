//
//  PayButton.swift
//  TestSapsan
//
//  Created by Дмитрий Дуров on 15.02.2023.
//

import UIKit

final class PayButton: UIButton {
    
    // MARK: - Private properties
    
    private var originalButtonText: String?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        self.setTitle("", for: .normal)
        showSpinning()
    }
    
    func hideLoading() {
        self.setTitle(originalButtonText, for: .normal)
        activityIndicator.stopAnimating()
    }

    // MARK: - Private methods
    
    private func setButton() {
        backgroundColor = .black
        titleLabel?.font = .systemFont(ofSize: 40)
        tintColor = .white
        layer.cornerRadius = 25
    }
    
    private func showSpinning() {
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: activityIndicator,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: activityIndicator,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        self.addConstraint(yCenterConstraint)
    }
}
