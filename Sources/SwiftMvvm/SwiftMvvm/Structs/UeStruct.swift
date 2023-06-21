//
//  UeStruct.swift
//  SwiftMvvm
//
//  Created by etudiant on 28/05/2023.
//

import Foundation

extension UE {
    struct Data: Identifiable {
        let id = UUID()
        var coefficient: Double
        var moyenne: Double
        var nom: String
        var listeMatiere: [Matiere]
        var data: Data {
            Data(coefficient: self.coefficient, moyenne: self.moyenne, nom: self.nom, listeMatiere:self.listeMatiere)
            }
    }
}
  
