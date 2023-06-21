import SwiftUI


struct UeView: View {
    
   @ObservedObject var blocs : BlocVm
    
    var body: some View {
        VStack {
            ForEach(blocs.someUeVM) { ue in
                HStack {
                    Text(ue.nom)
                     .font(.subheadline)
                     .foregroundColor(.primary)
                 Spacer()
                 Text("\(ue.coefficient)")
                    NavigationLink(destination: MatiereView(ue: UeVm(withModel: UE(id: UUID(), coefficient: 4, moyenne: 3, nom: "HST", listeMatiere: [])) )) {
                        Image(systemName: "square.and.pencil")
                    }
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 10)
                HStack {
                    Capsule()
                        .fill(ue.moyenne < 10 ? .red : .blue)
                        .frame(height: 20)
                        .frame(width: CGFloat(ue.moyenne) * 10)
                        .background(Color.clear)
                    Text("\(ue.moyenne)")
                }
                .padding()
                
                Divider()
            }
        }
        .padding()
    }
}

struct UeView_Previews: PreviewProvider {
    static var previews: some View {
        UeView(blocs: BlocVm(withModel: BlocModel(Nombloc: "ANG", Moyenneg: 12, listeUE: [])))
    }
}

