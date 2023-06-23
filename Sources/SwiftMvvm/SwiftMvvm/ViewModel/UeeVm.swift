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


class UeVM : ObservableObject, Identifiable, Equatable,Hashable {
    static func == (lhs: UeVM, rhs: UeVM) -> Bool {
        lhs.id == rhs.id
    }
    private var notificationFuncs: [AnyHashable:(UeVM) -> ()] = [:]
    func onNotifyChanged(source:MatiereVM){
        if let index = self.model.matieres.firstIndex(where: {$0 == source.model}) {
            self.model.matieres[index] = source.model
        }
            self.objectWillChange.send()
        }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.nom)
        hasher.combine(self.totalMoyenne)
        }
    public func subscribe(with subscriber: AnyHashable, andWithFunction function:@escaping (UeVM) -> ()) {
        notificationFuncs[subscriber] = function
       }
    public func unsubscribe(with subscriber: AnyHashable) {
            notificationFuncs.removeValue(forKey: subscriber)
        }
     func onNotifyChanged(){
        for f in notificationFuncs.values {
                f(self)
            }
        }
    @Published  var totalMoyenne: Double = 0.0 {
        didSet{
            let moy = updateTotalMoyenne()
            if moy != self.totalMoyenne {
                self.totalMoyenne = moy
            }
        }
    }
    public func updateTotalMoyenne()->Double {
        let totalMoyenne = someMatieresVM.reduce(0.0) { $0 + Double($1.moyenne) * Double($1.coef) }
        let totalCoef = someMatieresVM.reduce(0.0) { $0 + Double($1.coef) }
       print("ue")
        print(self.someMatieresVM.count)
        return totalMoyenne / totalCoef

    }
    init(withUe ue : Ue) {
        self.model = ue
         
     }
    @Published var model : Ue = DataStub().load()[0]{
        willSet(newValue) {
                    if !self.someMatieresVM.map({$0.model}).compare(to: newValue.matieres){
                        self.someMatieresVM.forEach { $0.unsubscribe(with: self) }
                    }
                }
        didSet{
            if self.model.nom != self.nom {
                self.nom = self.model.nom
            }
            if self.model.coef != self.coef {
                self.coef = self.model.coef
            }
            if !self.model.matieres.compare(to: self.someMatieresVM.map({$0.model})){
                self.someMatieresVM = self.model.matieres.map({MatiereVM(withMat: $0)})
                self.someMatieresVM.forEach { mvm in
                    mvm.subscribe(with: self, andWithFunction: onNotifyChanged(source:))
             }
           
            }
            let moyen = updateTotalMoyenne()
            if moyen != self.totalMoyenne {
                self.totalMoyenne = moyen
            }
            self.onNotifyChanged()
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
    var coef: Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef
             }
        }
    }
    @Published var someMatieresVM: [MatiereVM] = [] {
        didSet {
            let someModelMatiere = self.someMatieresVM.map({$0.model})
                if !self.model.matieres.compare(to: someModelMatiere){
                    self.model.matieres = someModelMatiere.map({$0})
                 
                }
            }
        }
    public init (){}
    @Published
    var isEditing: Bool = false
    
    private var copy: UeVM { UeVM(withUe: self.model) }
    
    var editedCopy: UeVM?
    
    func onEditing(){
        editedCopy = self.copy
        isEditing = true
    }
    
    func onEdited(isCancelled cancel: Bool = false) {
        if !cancel {
            if let editedCopy = editedCopy {
                self.model = editedCopy.model
            }
        }
        isEditing = false
    }
    
    var addedItem: MatiereVM? = MatiereVM(withMat: Matiere(name: "", moy: 0.0, coef: 1))
    
    @Published
    var isAdding: Bool = false
    
    func onAdding() {
        addedItem = MatiereVM()
        isAdding = true
    }
    func onAdded(isCancelled cancel:Bool = false) {
           if !cancel {
               if let addedItem = addedItem {
                   self.someMatieresVM.append(addedItem)
                   addedItem.subscribe(with: self, andWithFunction: onNotifyChanged(source:))
               }
           }
           addedItem = nil
           isAdding = false
       }
    func onDeleted(_ matiere:MatiereVM, isCancelled cancel: Bool = false) {
        if !cancel {
            if self.someMatieresVM.contains(matiere) {
                self.someMatieresVM.filter { $0 == matiere }
                                   .forEach { $0.unsubscribe(with: self) }
                self.someMatieresVM.removeAll(where: {$0 == matiere})
            }
        }
    }

}


