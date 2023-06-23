//
//  CollectionVMUe.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
 
class CollectionVMUe : ObservableObject,Identifiable,Equatable {
    static func == (lhs: CollectionVMUe, rhs: CollectionVMUe) -> Bool {
        lhs.id == rhs.id
    }
    
       public var id: UUID { model.id }

   
    
    @Published var model : UeCollection = UeCollection(nom: "", ues: []){
        didSet{
            if self.model.nom != self.nom {
                self.nom = self.model.nom
            }
            if !self.model.ues.compare(to: self.someUesVM.map({$0.model})){
                            self.someUesVM = self.model.ues.map({UeVM(withUe: $0)})
                        }
        }
    }
  
    @Published var nom: String = "" {
        didSet {
            if self.model.nom != self.nom {
                self.model.nom = self.nom
            }
        }
    }
    
    @Published var someUesVM: [UeVM] = [] {
        didSet {
            let someModelUe = self.someUesVM.map({$0.model})
                        if !self.model.ues.compare(to: someModelUe) {
                            self.model.ues = someUesVM.map({$0.model})
             }
        }
    }

    
    init(withUe ues : UeCollection) {
         self.model = ues
    }

     
    
    
}




