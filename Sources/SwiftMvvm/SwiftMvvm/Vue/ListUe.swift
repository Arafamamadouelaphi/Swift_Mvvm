//
//  ListUe.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct ListUe: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Label("UEs", systemImage: "doc.fill")
                    .font(.title)
                Text("Détails des UEs")
                LazyVStack {
                    HStack {
                        UeView(blocs: BlocVm(withModel: BlocModel(Nombloc: "HST", Moyenneg: 14, listeUE: [])))                        
                        Divider()
                    }
                    .padding()                    
                }
                .padding()
                .background(Color("ListItemBackgroundColor"))
                .cornerRadius(12)
            }
        }
        
    }
    
    struct ListUe_Previews: PreviewProvider {
        static var previews: some View {
            ListUe()
        }
    }}
