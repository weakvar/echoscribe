//
//  String+NSLocalizedString.swift
//  Echoscribe
//
//  Created by Vladislav Len on 05.12.2021.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
    
}
