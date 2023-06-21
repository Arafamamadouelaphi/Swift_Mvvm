//
//  UeeVm.swift
//  SwiftMvvm
//
//  Created by etudiant on 11/06/2023.
//

import Foundation
/*public let id: UUID
 var coefficient: Double
 var moyenne: Double
 var nom: String
 var listeMatiere: [Matiere]
 */
class UeVm : ObservableObject,Equatable , Identifiable {        
   static func == (lhs: UeVm, rhs: UeVm) -> Bool {
        lhs.id == rhs.id
    }
    
    // dans le model on met à jour les donnes du vue model les proprietes à présenter à la vue
    @Published var model: UE = UE(id: UUID(), coefficient: 2,moyenne: 10,nom: "", listeMatiere: []  )  {
        didSet{
            
            if self.model.nom != self.nom {
                self.nom = self.model.nom
            }
            
            if self.model.coefficient != self.coefficient {
                self.coefficient = self.model.coefficient
            }
            if self.model.moyenne != self.moyenne
            {
                self.moyenne = self.model.moyenne
            }
            if !self.model.listeMatiere.compare(to: self.someMatVM.map({$0.model})){
                            self.someMatVM = self.model.listeMatiere.map({MatiereVm(withModel: $0)})
                        }
        }
    } 
    public var id: UUID { model.id }
    
    @Published
        var nom: String = "" {
            didSet {
                if self.model.nom != self.nom {
                    self.model.nom = self.nom
                }
            }
        }
    @Published
    var coefficient : Double = 0 {
        didSet {
            if self.model.coefficient != self.coefficient {
                self.model.coefficient = self.coefficient
            }
        }
    }
    @Published
    var moyenne : Double = 0 {
        didSet {
            if self.model.moyenne != self.moyenne {
                self.model.moyenne = self.moyenne
            }
        }
    }
    
/* chaque fois que  someNounoursVM est modifié, le bloc  didSet vérifie si les modèles qu'il contient sont différents de ceux déjà présents dans self.model.someNounours. Si tel est le cas, il met à jour self.model.someNounours avec les nouveaux modèles.*/
    @Published var someMatVM: [MatiereVm] = [] {
            didSet {
                let someModelMatier = self.someMatVM.map({$0.model})
                if !self.model.listeMatiere.compare(to: someModelMatier){
                    self.model.listeMatiere = someMatVM.map({$0.model})
                }
            }
        }
    init(withModel UE: UE) {
         model = UE
    }
  
    
    
}

