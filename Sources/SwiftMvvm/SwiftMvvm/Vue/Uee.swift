//
//  UePage.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
import SwiftUI
struct Uee: View {
    @ObservedObject var ue: UeVM
    @ObservedObject var bloc: BlocVM
    

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    Text(ue.nom)
                        .bold()
                        .font(.title)
                }
                Divider()
                HStack(spacing: 15) {
                    Capsule()
                        .foregroundColor(ue.totalMoyenne * 5 < 50 ? .red : .green)
                        .frame(width: ue.totalMoyenne * 5, height: 22)
                    Text(ue.coef.description)
                    Text(ue.totalMoyenne.description)
                }
                
                ScrollView {
                    ForEach(ue.someMatieresVM) { mat in
                        MatiereUnq(matiere: mat, ue : ue, bloc : bloc, islocked: true)
                    }
                }
            }
            
        }
        .navigationBarItems(trailing: Button(action: {
           
            self.ue.onEditing()
        }) {
            Text( self.ue.isEditing ? "Done" : "Modifier")
        })
        .sheet(isPresented: $ue.isEditing) {
            EditSheet(ue: ue, isEditMode: $ue.isAdding)
        }
    }
}
