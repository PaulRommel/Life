//
//  String+Extension.swift
//  Life
//
//  Created by Anton on 05/09/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
