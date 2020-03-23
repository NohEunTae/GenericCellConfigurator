//
//  CellConfigurator.swift
//  Pods
//
//  Created by user on 23/03/2020.
//

import UIKit

protocol CellConfigurator: GenericContainerCellIdentifiable {
    func rowHeight(availableWidth: CGFloat) -> CGFloat
    
    func configure(cell: UIView)
    func configure(cell: UIView, delegate: AnyObject?)

    /// Optional Function
    func configure(didSelecteRowAt indexPath: IndexPath)

    // temporary value
    /// it is data type of Configurator
    var data: Any { get }
}
