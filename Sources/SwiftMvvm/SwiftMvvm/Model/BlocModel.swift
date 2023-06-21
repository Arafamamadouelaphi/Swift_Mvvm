//
//  BlocModel.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import Foundation
struct BlocModel: Identifiable ,Equatable {
    static func == (lhs: BlocModel, rhs: BlocModel) -> Bool {
        lhs.id == rhs.id
    }
        let id = UUID()
        var Nombloc: String
        var Moyenneg: Double
        var listeUE: [UE]
    public init(Nombloc: String, Moyenneg: Double,  listeUE: [UE]) {
        self.Nombloc = Nombloc
        self.Moyenneg = Moyenneg        
        self.listeUE = listeUE
    }
    //a modifier l calcul de la moyenne
   // func MoyenneBloc(bloc: BlocModel) -> Double {
       // let sumOfMoyennes = bloc.listeUE.reduce(into: 0.0) { $0 + $1.MoyenneUE }
       // let numberOfUEs = Double(bloc.listeUE.count)
      //  return sumOfMoyennes / numberOfUEs
   // }

    
}
