//
//  Matiere.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
public struct Matiere: Identifiable, Equatable {
    
    public let id: UUID
    public  var nom: String
    public   var coefficient: Double
    public   var note:Double
    
    
     public init(id: UUID, nom: String, coefficient: Double,note :Double  ) {
        self.id = id
        self.nom = nom
        self.coefficient = coefficient
        self.note=note
    
    }
}
