import SwiftUI

struct RastvorimostView: View {
    
    @State var cation: String = "K+"
    @State var anion:  String = "I-"
    
    var body: some View {
        VStack {
            Text("Растворимость:")
            HStack {
                Picker("Катионы", selection: $cation) {
                    ForEach(cationy, id: \.self) { cationName in
                        Text(cationName)
                    }
                }.font(.footnote)
                Picker("Анионы", selection: $anion) {
                    ForEach(aniony, id: \.self) { anionName in
                        Text(anionName)
                    }
                }
            }
            Divider()
            Text("\(rasvorimost[[cationy.firstIndex(of: cation)!, aniony.firstIndex(of: anion)!]] as! String)")
        }
    }
}

struct RastvorimostView_Previews: PreviewProvider {
    static var previews: some View {
        RastvorimostView()
    }
}
