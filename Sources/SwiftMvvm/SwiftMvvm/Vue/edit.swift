//
//  edit.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
import SwiftUI

struct edit: View {
    @Binding public var ue : Ue
  
    var body: some View {
        NavigationView{
            VStack{
                Text(ue.nom)
                TextField("name", text:$ue.nom )
            }
        }.toolbar{
            Button(action: {
                
            }) {
                                      
        Image(systemName:   "square.and.pencil")
            }
        }
    }
}

 
