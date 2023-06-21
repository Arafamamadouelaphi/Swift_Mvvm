//
//  UE.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
public struct UE: Identifiable,Equatable {
    public static func == (lhs: UE, rhs: UE) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id: UUID
    var coefficient: Double
    var moyenne: Double
    var nom: String
    var listeMatiere: [Matiere]
    public init(id: UUID, coefficient: Double, moyenne: Double, nom: String, listeMatiere: [Matiere]) {
        self.id = id
        self.coefficient = coefficient
        self.moyenne = moyenne
        self.nom = nom
        self.listeMatiere = listeMatiere
    }
    func calculerMoyenneUE() -> Double {
        let sommeDesNotes = listeMatiere.reduce(into: 0) { $0 + $1.note }
            let nombreDeMatieres = Double(listeMatiere.count)
            return sommeDesNotes / nombreDeMatieres
        }
}
