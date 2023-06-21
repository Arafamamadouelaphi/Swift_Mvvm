//
//  BlocVm.swift
//  SwiftMvvm
//
//  Created by etudiant on 28/05/2023.
//

// BlocVM.swift

import Foundation

/* let id = UUID()
 var Nombloc: String
 var Moyenneg: Double
 var listeUE: [UE]*/

class BlocVm : ObservableObject ,Equatable{
    static func == (lhs: BlocVm, rhs: BlocVm) -> Bool {
        lhs.id == rhs.id
    }
    
    // dans le model on met à jour les donnes du vue model les proprietes à présenter à la vue
    @Published var model: BlocModel = BlocModel(Nombloc: "", Moyenneg: 17, listeUE: [])
    {
        didSet{
            
            if self.model.Nombloc != self.Nombloc {
                self.Nombloc = self.model.Nombloc
            }
            
            if self.model.Moyenneg != self.Moyenneg {
                self.Moyenneg = self.model.Moyenneg
            }
            if !self.model.listeUE.compare(to: self.someUeVM.map({$0.model})){
                            self.someUeVM = self.model.listeUE.map({UeVm(withModel: $0)})
                        }
           
        }
    }
    public var id: UUID { model.id }
    
    @Published
        var Nombloc: String = "" {
            didSet {
                if self.model.Nombloc != self.Nombloc {
                    self.model.Nombloc = self.Nombloc
                }
            }
        }
    @Published
    var Moyenneg : Double = 0 {
        didSet {
            if self.model.Moyenneg != self.Moyenneg {
                self.model.Moyenneg = self.Moyenneg
            }
        }
    }
    //collection on met a jour le Ue avec l dernier
    @Published var someUeVM: [UeVm] = [] {
            didSet {
                let someModelUe = self.someUeVM.map({$0.model})
                if !self.model.listeUE.compare(to: someModelUe){
                    self.model.listeUE = someUeVM.map({$0.model})
                }
            }
        }
   
    init(withModel BlocModel: BlocModel) {
         model = BlocModel
    }
  
    
    
}


