//
//  HomeView.swift
//  SwiftMvvm
//
//  Created by etudiant on 23/05/2023.
//

import SwiftUI

struct HomeView: View{

    var body: some View {
        Text("Calculatrice ")
            .font(.headline)
            .padding(.trailing, 20)
            .font(.headline)
            .foregroundColor(.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
