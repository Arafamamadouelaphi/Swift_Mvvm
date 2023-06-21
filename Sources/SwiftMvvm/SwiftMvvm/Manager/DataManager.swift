//
//  DataManage.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//


import Foundation

public protocol DataManager {
    func loadUes() -> [UE]
    func save(ues: [UE])
}
