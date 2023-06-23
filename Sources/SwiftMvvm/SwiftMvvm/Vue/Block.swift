//
//  Block.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//


import SwiftUI

import SwiftUI

struct Block: View {
  
    @ObservedObject var manager : ManagerVM
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "menucard.fill")
                Text("Blocs").bold().font(.title)
            }
            
            Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir votre diplôme.").padding(.bottom)
            BlockItem(total: .constant( manager.total), name: .constant("Total"))
           
            ForEach(manager.blocs) { item in
                if item.isUnique {
                    BlockItem(total: .constant(item.totalMoyenne), name: .constant(item.nom))
                    Divider()
                }
               
            }
        }.padding().background(NoteColor().ue_back).cornerRadius(10)
    }
}
struct Block_Previews: PreviewProvider {
    static var previews: some View {
        let blocs =  [
 BlocVM(withBloc: Bloc(nom: "Total", ues:DataStub().load(),isUq: false)),
BlocVM(withBloc: Bloc(nom: "Projet", ues: DataStub().loadUeStage_Proj(), isUq: true))]
        Block(manager: ManagerVM(withBlocs: blocs) )
        
    }
}
