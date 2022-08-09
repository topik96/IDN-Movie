//
//  UICollectionView+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, withReuseIdentifier identifier: String? = nil, for indexPath: IndexPath) -> T {
        let identifier = identifier ?? String(describing: type)
        return (dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T)!
    }
}
