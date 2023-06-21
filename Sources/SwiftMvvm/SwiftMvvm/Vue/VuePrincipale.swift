//
//  VuePrincipale.swift
//  SwiftMvvm
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct VuePrincipale: View {
    var body: some View {
           NavigationStack {
               ScrollView {
                   BlocView()
                   Divider()                
                   ListUe()
               }
               .navigationTitle("Calculette")
           }
       }
}

struct VuePrincipale_Previews: PreviewProvider {
    static var previews: some View {
        VuePrincipale()
    }
}
