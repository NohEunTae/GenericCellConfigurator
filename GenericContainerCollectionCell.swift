//
//  GenericContainerCollectionCell.swift
//  Pods
//
//  Created by user on 23/03/2020.
//

import Foundation

public class GenericContainerCollectionCell<T: ConfigurableContainerView>: UICollectionViewCell, ConfigurableCell {
    
    public typealias ViewType = T
    
    private(set) lazy public var view: ViewType = {
        guard let view = ViewType.initFromNib() else {
            return ViewType()
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
    }
    
    private func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false

        let cv = contentView
        cv.addSubview(view)
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: cv.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: cv.trailingAnchor),
                view.topAnchor.constraint(equalTo: cv.topAnchor),
                view.bottomAnchor.constraint(equalTo: cv.bottomAnchor)
            ])
        } else {
            let bottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: cv, attribute: .bottom, multiplier: 1, constant: 0)
            
            let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: cv, attribute: .top, multiplier: 1, constant: 0)
            
            let leadingConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: cv, attribute: .leading, multiplier: 1, constant: 0)
            
            let trailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: cv, attribute: .trailing, multiplier: 1, constant: 0)
            
            bottomConstraint.isActive = true
            topConstraint.isActive = true
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true
            
            addConstraint(bottomConstraint)
            addConstraint(topConstraint)
            addConstraint(leadingConstraint)
            addConstraint(trailingConstraint)
        }
    }
}
