//
//  MatiereEditView.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//

import SwiftUI

struct MatiereEditView: View {
    @Binding var matiere : Matiere
    var body: some View {
        VStack {
            NavigationLink(destination: TextField("", text: $matiere.nom, prompt: Text("enter the name"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Name")) {
                    HStack {
                        Text("Nom")
                        Spacer()
                        Text(matiere.nom)
                            .foregroundColor(.gray)
                    }
                }
            
            NavigationLink(destination: TextField("", value: $matiere.coefficient, format: .number, prompt: Text("enter the count"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Hair count")) {
                    HStack {
                        Text("coef")
                        Spacer()
                        Text(String(matiere.coefficient))
                            .foregroundColor(.gray)
                    }
                }
            
            NavigationLink(destination: TextField("", value: $matiere.note, format: .number, prompt: Text("enter the note"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("note")) {
                    HStack {
                        Text("Note")
                        Spacer()
                        Text(String(matiere.note))
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}

struct MatiereEditView_Previews: PreviewProvider {
    static var previews: some View {
        MatiereEditView(matiere: .constant(Stub().loadUes()[0].listeMatiere[0]))
    }
}
