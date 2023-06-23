import SwiftUI



public struct UeView : View{
   @ObservedObject var bloc : BlocVM
   @ObservedObject var ue : UeVM
    public var body: some View {
        
        VStack(alignment:.leading){

            Divider()
            HStack(spacing: 20){
                Text(ue.nom ).bold().font(.caption).padding()
                Spacer()
                Text(ue.coef.description)
            }
            
       
            HStack(){
                Capsule().foregroundColor( ue.totalMoyenne * 5 < 50 ? .red : .green).frame(width: ue.totalMoyenne * 5 ,height: 22)
              Spacer()
                Text(ue.totalMoyenne.description)
                Spacer()
                NavigationLink(destination: Uee(ue: ue, bloc: bloc)) {
                    Image(systemName:   "square.and.pencil")
                }
            }
            Divider()
            
            
        }.padding()
    }
}

struct UeView_Previews: PreviewProvider {
    static var previews: some View {
       
            let ue =  DataStub().load()[0]
            let ueVM = UeVM(withUe: ue)
            
        UeView(bloc: BlocVM(withBloc: Bloc(nom: "Projet/Stage", ues: DataStub().loadUeStage_Proj(),isUq: true)), ue: ueVM)
        }
   
}
