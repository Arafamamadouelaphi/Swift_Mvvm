//
//  ArrayExtension.swift
//  SwiftMvvm
//
//  Created by etudiant on 11/06/2023.
//

import Foundation



//comparaison de model ,vm
extension Array where Element: Equatable {
    func compare(to other: [Element]) -> Bool {
        self.count == other.count && self.allSatisfy({ elt in
            other.contains { otherElt in
                otherElt == elt
            }
        })
    }
}
