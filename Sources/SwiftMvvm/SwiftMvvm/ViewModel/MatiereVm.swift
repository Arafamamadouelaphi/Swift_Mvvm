//
//  MatiereVm.swift
//  SwiftMvvm
//
//  Created by etudiant on 28/05/2023.
//

import Foundation

class MatiereVm : ObservableObject ,Identifiable {
    // dans le model on met à kjour les donnes du vue model les proprietes à présenter à la vue
    //on vérifie que someNounourscollection de Nounoursdu modèle est différent du someNounoursVMcollection de NounoursVM
    @Published var model: Matiere = Matiere(id: UUID(), nom: "Ma mat", coefficient: 2, note: 12)  {
        didSet{
            
            if self.model.nom != self.nom {
                self.nom = self.model.nom
            }
            
            if self.model.coefficient != self.coefficient {
                self.coefficient = self.model.coefficient
            }
            if self.model.note != self.note
            {
                self.note = self.model.note
            }
        }
    }
 /*
  public let id: UUID
  public  var nom: String
  public   var coefficient: Double
  public   var note:Double
  */
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
    var note : Double = 0 {
        didSet {
            if self.model.note != self.note {
                self.model.note = self.note
            }
        }
    }
    
    init(withModel Matiere: Matiere) {
         model = Matiere
    }
  
    
    
}
