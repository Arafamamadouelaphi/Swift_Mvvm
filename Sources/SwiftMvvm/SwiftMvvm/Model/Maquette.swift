//
//  Maquette.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
struct Maquette {
    var listeBloc: [BlocModel]
    var listeUE: [UE]    
    public init( listeBloc: [BlocModel], listeUE: [UE]) {
        self.listeBloc = listeBloc
        self.listeUE = listeUE
    }
}
