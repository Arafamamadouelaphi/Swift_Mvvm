import SwiftUI


struct MatiereView: View {
    @ObservedObject var ue : UeVm
     @State var isEditing: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Label("Coefficient :\(ue.coefficient)", systemImage: "xmark.circle.fill")
                    Label("Détails des notes: ", systemImage: "note.text")
                }
                VStack {
                    ForEach(ue.someMatVM) { matiere in
                       MatiereUniq(mat: matiere)
                    }
                }
                .toolbar{
                            Button(action: {
                                self.isEditing.toggle()
                            }){
                                Text("Edit")
                            }
                        }
                
          .sheet(isPresented: $isEditing){
                NavigationStack{
                    EditableView(editableUe: ue)
                        .toolbar{
                            ToolbarItem(id: "done", placement: .confirmationAction){
                                Button(action: {
                                    self.isEditing.toggle()
                                }){
                                    Text("Done")
                                }
                            }
                            ToolbarItem(id: "cancel", placement: .cancellationAction){
                                Button(action: {
                                    self.isEditing.toggle()
                                }){
                                    Text("Cancel")
                                }
                            }
                        }
                        .navigationTitle("Edit: \(ue.nom)")
                }
            }
            }
        }
    }
}

struct MatiereView_Previews: PreviewProvider {
    static var previews: some View {
        MatiereView(ue: UeVm(withModel: UE(id: UUID(), coefficient: 2, moyenne: 16, nom: "MAT", listeMatiere: [])))
    }
}

