//
//  NibInitable.swift
//  Pods
//
//  Created by user on 22/03/2020.
//

import UIKit

protocol NibInitable {
    static func initFromNib() -> Self?
}

extension NibInitable where Self: UIView {
    static func initFromNib() -> Self? {
        guard let xibName = String(describing: self).components(separatedBy: ".").last else { return nil }
        // check xib exists.
        guard let _ = Bundle.main.path(forResource: xibName, ofType: "nib") else { return nil }
        return Bundle.main.loadNibNamed(xibName, owner: nil, options: nil)?.first as? Self
    }
}

extension NibInitable where Self: UIViewController {
    static func initFromNib() -> Self? {
        guard let xibName = String(describing: self).components(separatedBy: ".").last else { return nil }
        return ((Self)(nibName: xibName, bundle: nil))
    }
}

extension UIView: NibInitable {}
extension UIViewController: NibInitable {}
