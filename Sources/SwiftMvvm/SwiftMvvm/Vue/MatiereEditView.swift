//
//  MatiereEditView.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
import SwiftUI


struct MatiereEditView   : View{
    @ObservedObject var matiere: MatiereVM
    
    var body: some View {
        HStack{
            if self.matiere.isEditing {
                VStack {
                    TextField("Nom", text: $matiere.name)
                    TextField("Coefficient", value: $matiere.coef, format: .number)
                    Divider()
                }
            } else {
                VStack {
                    Text(matiere.name)
                    Text(matiere.coef, format: .number)
                    Divider()
                }
            }
            Button(action: {
                if self.matiere.isEditing {
                    print(self.matiere.coef)

                    self.matiere.onEdited(isCancelled: true)
                } else {
                    self.matiere.onEditing()
                    
                }
                
            }) {
                Text( self.matiere.isEditing ? "Done" : "Modifier")
            }
            
           
            
        }
       
    }
}

struct MatiereEditView_Previews: PreviewProvider {
    static var previews: some View {
        let matiere = MatiereVM(withMat: DataStub().loadMartiereUE1()[0])
        MatiereEditView(matiere: matiere)
    }
}
