//
//  ManagerVM.swift
//  SwiftMvvm
//
//  Created by etudiant on 11/06/2023.
//

import Foundation

//pouvoir les utiliser dans la vue 
class ManagerVM: ObservableObject {
    @Published var blocs: [BlocVm] = []
    
    public init(withBeds blocs: [BlocModel]){
        self.blocs = blocs.map({BlocVm(withModel: $0)})
    }
    
    public init(withBeds blocs: [BlocVm]){
        self.blocs = blocs
    }
}
