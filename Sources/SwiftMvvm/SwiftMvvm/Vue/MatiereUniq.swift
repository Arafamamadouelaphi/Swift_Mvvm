// MatiereUniq.swift
// SwiftMvvm
//
// Created by etudiant on 30/05/2023.
//

import SwiftUI

struct MatiereUniq: View {
   //1 changement avec Vm 
    @ObservedObject var mat: MatiereVm
     @State private var islocked = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(mat.nom)
                    .font(.title2)
                
                Spacer()
                
                Text("\(mat.coefficient)")
                    .font(.title2)
                    .padding(.horizontal, 30.0)
            }
            .padding(.horizontal, 11.0)
            
            HStack {
                Button(action: {
                    islocked.toggle()
                }) {
                    Image(systemName: islocked ? "lock" : "lock.open")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                GeometryReader { geometry in
                    HStack {
                        Capsule()
                            .fill(mat.note < 10 ? .red : .blue)
                            .frame(height: 20)
                            .frame(width: CGFloat(mat.note) / 30 * geometry.size.width)
                            .gesture(
                                islocked ? DragGesture(minimumDistance: 0).onChanged({_ in })
                                    : DragGesture(minimumDistance: 23)
                                    .onChanged({ value in
                                        let newNote = value.location.x / geometry.size.width * 20
                                        mat.note = min(max(newNote, 0), 20)
                                    })
                            )
                        
                        Text("\(Double(mat.note))")
                        
                        if !islocked {
                            Image("gouffle")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                
                Divider()
            }
        }
    }
}

struct MatiereUniq_Previews: PreviewProvider {
    static var previews: some View {
        MatiereUniq(mat: MatiereVm(withModel: Matiere(id: UUID(), nom: "JAVA", coefficient: 6, note: 19)))
    }
}

