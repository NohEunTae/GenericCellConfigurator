//
//  GenericContainerCellIdentifiable.swift
//  Pods
//
//  Created by user on 22/03/2020.
//

import Foundation

public protocol GenericContainerCellIdentifiable {
    static var reuseIdentifier: String { get }
}
