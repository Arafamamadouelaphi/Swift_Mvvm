//
//  EditableView.swift
//  SwiftMvvm
//
//  Created by etudiant on 10/06/2023.
//

import SwiftUI


struct EditableView: View {
    @ObservedObject var editableUe:UeVm
    @State var isEditing: Bool = false
    var body: some View {
        NavigationStack{
            Form{
                NavigationLink{
                    Form{
                        TextField("", text: $editableUe.nom, prompt: Text("enter the  name"))
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Name")
                }
                label: {
                    HStack{
                        Text("Name")
                        Spacer()
                        Text(editableUe.nom)
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink{
                    Form{
                        TextField("", value: $editableUe.coefficient, format: .number, prompt: Text("enter the COEF"))
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("enter the COEFt")
                }
                label: {
                    HStack{
                        Text("enter the COEFt")
                        Spacer()
                        Text(String(editableUe.coefficient))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink{
                    Form{
                        TextField("", value: $editableUe.moyenne, format: .number, prompt: Text("enter the NOTE"))
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("enter the NOTE")
                }
                label: {
                    HStack{
                        Text("enter the NOTE")
                        Spacer()
                        Text(String(editableUe.moyenne))
                            .foregroundColor(.gray)
                    }
                }
                //
            }
        }
    }
}
    
    struct EditableView_Previews: PreviewProvider {
        static var previews: some View {
            let ueee = Stub().loadUes()[0]
            EditableView(editableUe:UeVm(withModel:ueee))
        }
    }
    





