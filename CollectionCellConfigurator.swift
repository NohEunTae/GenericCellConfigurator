//
//  CollectionCellConfigurator.swift
//  Pods
//
//  Created by user on 23/03/2020.
//

import Foundation

public final class CollectionCellConfigurator<CellType: ConfigurableCell>: CellConfigurator where CellType: UICollectionViewCell {
    
    public static var cellType: CellType.Type { return CellType.self }
    public static var reuseIdentifier: String { return CellType.reuseIdentifier }
    
    let item: CellType.ViewType.DataType
    
    private var configurableView: CellType.ViewType?
    
    var data: Any {
        return item
    }
    
    init(item: CellType.ViewType.DataType) {
        self.item = item
    }
    
    func rowHeight(availableWidth: CGFloat) -> CGFloat {
        return self.rowHeight(availableWidth: availableWidth, viewModel: item)
    }
    
    func configure(cell: UIView) {
        configure(cell: cell, delegate: nil)
    }
    
    func configure(cell: UIView, delegate: AnyObject?) {
        guard let configurableInstance = cell as? CellType else {
            print("it does not configurable instance!")
            return
        }
        configurableView = configurableInstance.view
        configurableView?.configure(data: item)
        
        if let delegateObject = delegate as? CellType.ViewType.Delegate {
            configurableView?.delegate = delegateObject
        } else {
            print("expect protocol: \(CellType.ViewType.Delegate.self). but, actual value : \(String(describing: delegate))")
            
        }
    }
    
    func configure(didSelecteRowAt indexPath: IndexPath) {
        guard let tappableInstance = configurableView,
            let tappableMethod = tappableInstance.tappableCell  else {
            print("it does not tapable cell!")
            return
        }
        
        tappableMethod(tappableInstance, indexPath)
    }
}

extension CollectionCellConfigurator {
    func rowHeight(availableWidth: CGFloat, viewModel: CellType.ViewType.DataType) -> CGFloat {
        let cell = CellType.init()
        cell.view.configure(data: viewModel, isUsingSizeCalculation: true)
        let availableSize = CGSize(width: availableWidth, height: UIView.layoutFittingCompressedSize.height)
        let size = cell.contentView.systemLayoutSizeFitting(availableSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return size.height
    }
}
