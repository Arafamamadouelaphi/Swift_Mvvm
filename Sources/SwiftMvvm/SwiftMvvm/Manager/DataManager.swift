//
//  DataManage.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//


import Foundation

public protocol DataManager {
    func load() -> [Ue]
    func loadUeStage_Proj() -> [Ue]
    func save(ues: [Ue])
}
