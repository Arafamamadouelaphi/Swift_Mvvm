//
//  Stub.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//

import Foundation

public struct Stub : DataManager {

    public init(){}
    
    public func loadUes() -> [UE] {
        
        var ues: [UE] = []
        
        
      /*  UE 1 : Génie Logiciel (coeff. 6) */
        ues.append(UE(id: UUID(), coefficient: 6, moyenne: 0.0, nom: "Systèmes et réseaux ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Internet des Objets", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Réseaux", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Services Mobiles", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Système ", coefficient: 5, note: 0.0),
                      ]))
        ues.append(UE(id: UUID(), coefficient: 6, moyenne: 0.0, nom: "Génie Logiciel",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Processus de développement", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Programmation Objets", coefficient: 9, note: 0.0),
                        Matiere(id: UUID(), nom: "Qualité de développpement", coefficient: 5, note: 0.0),
                        Matiere(id: UUID(), nom: "Remise à niveau objets", coefficient: 4, note: 0.0),
                      ]))
        ues.append(UE(id: UUID(), coefficient: 6, moyenne: 0.0, nom: "Insertion Professionnelle ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Anglais", coefficient: 5, note: 0.0),
                        Matiere(id: UUID(), nom: "Economie", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Gestion", coefficient: 3, note: 0.0),
                        Matiere(id: UUID(), nom: "Communication", coefficient: 4, note: 0.0),
                      ]))
        ues.append(UE(id: UUID(), coefficient: 9, moyenne: 0.0, nom: "Technologies Mobiles 1 ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Android ", coefficient: 6, note: 0.0),
                        Matiere(id: UUID(), nom: "Architecture de projets C# .NET", coefficient: 5, note: 0.0),
                        Matiere(id: UUID(), nom: "C++", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Swift", coefficient: 5, note: 0.0),
                      ]))
        ues.append(UE(id: UUID(), coefficient: 9, moyenne: 0.0, nom: "Technologies Mobiles 2 ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Architecture de projets C# .NET ", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "Client/Serveur", coefficient: 4, note: 0.0),
                        Matiere(id: UUID(), nom: "iOS ", coefficient: 5, note: 0.0),
                        Matiere(id: UUID(), nom: "Multiplateformes ", coefficient: 3, note: 0.0),
                        Matiere(id: UUID(), nom: "QT Quick ", coefficient: 5, note: 0.0),
                        Matiere(id: UUID(), nom: "Xamarin ", coefficient: 5, note: 0.0),
                      ]))
        ues.append(UE(id: UUID(), coefficient: 9, moyenne: 0.0, nom: "Projet  ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Projet ", coefficient: 1, note: 0.0),
                        
                      ]))
        ues.append(UE(id: UUID(), coefficient: 15, moyenne: 0.0, nom: "Stage  ",
                      listeMatiere: [
                        Matiere(id: UUID(), nom: "Stage ", coefficient: 1, note: 0.0),
                        
                      ]))
        
        
        
        
        
        return ues
    }
    
    public func save(ues: [UE]) {
    }
}
