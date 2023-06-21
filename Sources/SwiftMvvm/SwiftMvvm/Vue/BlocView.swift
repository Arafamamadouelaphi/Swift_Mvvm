//
//  BlocView.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct BlocView: View {
 
    var body: some View {
            VStack(alignment: .leading) {
                Label("Blocs", systemImage: "doc.on.doc.fill")
                    .font(.title)
                Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir votre diplôme.")
                HStack {
                    Label("Total", systemImage: "doc.on.doc.fill")
                    Spacer()
                    Label("11.67", systemImage: "graduationcap.circle.fill")
                }
                HStack {
                    Label("Total", systemImage: "doc.on.doc.fill")
                    Spacer()
                    Label("11.67", systemImage: "graduationcap.circle.fill")
                }
            }
            .padding()
            .background(Color("ListItemBackgroundColor"))
            .cornerRadius(12)
        }
    
    }


struct BlocView_Previews: PreviewProvider {
    static var previews: some View {
        BlocView()
    }
}
