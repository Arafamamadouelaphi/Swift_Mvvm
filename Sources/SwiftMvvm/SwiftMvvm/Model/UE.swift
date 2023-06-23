//
//  UE.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
public struct Ue : Identifiable, Equatable {
    public static func == (lhs: Ue, rhs: Ue) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id : UUID
     var nom: String
    var coef : Int
     var matieres: [Matiere]

    var totalMoyenne: Double {
        return Double(matieres.reduce(0) { $0 + $1.moyenne }) / Double(matieres.count)
        }
    
    init( nom: String, matieres: [Matiere], coef : Int) {
        self.id = UUID()
         self.nom = nom
        self.matieres = matieres
        self.coef = coef
    }
}
