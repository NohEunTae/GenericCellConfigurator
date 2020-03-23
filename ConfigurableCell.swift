//
//  ConfigurableCell.swift
//  Pods
//
//  Created by user on 23/03/2020.
//

import Foundation

public protocol ConfigurableCell: GenericContainerCellIdentifiable {
    
    associatedtype ViewType: ConfigurableContainerView
    
    var view: ViewType { get }
}

extension ConfigurableCell {
    public static var reuseIdentifier: String {
        return String(describing: ViewType.self)
    }
}
