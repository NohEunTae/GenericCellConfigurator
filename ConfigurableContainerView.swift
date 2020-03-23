//
//  ConfigurableContainerView.swift
//  Pods
//
//  Created by user on 22/03/2020.
//

import UIKit

public protocol ConfigurableContainerView: UIView, TappableCell {
    
    associatedtype DataType
    associatedtype Delegate
    
    var delegate: Delegate? { get set }
    
    func configure(data: DataType, isUsingSizeCalculation: Bool)
}

extension ConfigurableContainerView {
    func configure(data: DataType) {
        self.configure(data: data, isUsingSizeCalculation: false)
    }
}

@objc public protocol TappableCell {
    @objc optional func tappableCell(_ sender: UIView, didSelectRowAt: IndexPath)
}
