//
//  Home.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/06/2023.
//

import Foundation
import SwiftUI

struct Home: View {
   // @State public var ues  = DataStub().load()
    @StateObject  var manager: ManagerVM
    var body: some View {
        NavigationView{
             
           VStack(alignment : .leading){
               
               HStack {
          
                   Text("Calculette").bold().font(.title)
               }       
                Block(manager: manager )
               VStack(alignment : .leading){
                   HStack(alignment:.bottom){
                       Image(systemName: "doc.on.doc.fill")
                       Text("UEs").bold().font(.title)
                   }.padding()
                       
                       ScrollView{
                           ForEach(manager.blocs) { item in
                                ForEach(item.someUesVM) {
                                   ue in
                               
                                    UeView(bloc: item, ue:  ue)
                               }
                              
                           }
                           
                       }
               }.padding()             
                }.padding()
        }
       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let managerVM = ManagerVM(withBlocs: [BlocVM(withBloc: Bloc(nom: "Total", ues: DataStub().load(), isUq: false)),BlocVM(withBloc: Bloc(nom: "Projet", ues: DataStub().loadUeStage_Proj(),isUq: true))])
        Home(manager: managerVM )
    }
}
