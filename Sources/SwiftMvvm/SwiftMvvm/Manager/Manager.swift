//
//  Manager.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//

import Foundation


public struct Manager {
    let dataManager: DataManager
    public var ues: [UE] = []
    
    public init(withDataManager dataManager: DataManager){
        self.dataManager = dataManager
    }
    
    public mutating func loadUes() {
        self.ues.removeAll()
        for ue in self.dataManager.loadUes() {
            self.ues.append(ue)
        }
    }
    
    public func saveUes() {
        self.dataManager.save(ues:self.ues)
    }
}
