//
//  UeCollection.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
struct UeCollection : Identifiable, Equatable {
    
    public static func == (lhs: UeCollection, rhs: UeCollection) -> Bool {
            lhs.id == rhs.id
        }
    
    var id : UUID
  
    var nom: String
    var ues: [Ue]
    
    init(nom: String, ues: [Ue]) {
        self.id = UUID()
        self.nom = nom
        self.ues = ues
    }
}
