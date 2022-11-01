import SwiftUI

struct RastvorimostView: View {
    
    @State var cation: String = "K+"
    @State var anion:  String = "I-"
    
    var body: some View {


        VStack {
#if os(iOS)
        Spacer()
#endif
            Text("Растворимость:")
            HStack {
                Spacer()
                Picker("Катионы", selection: $cation) { ForEach(cationy, id: \.self) { Text($0) } }.font(.footnote)
                Spacer()
                Picker("Анионы", selection: $anion)   { ForEach(aniony,  id: \.self) { Text($0) } }.font(.footnote)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                switch (rasvorimost[[cationy.firstIndex(of: cation)!, aniony.firstIndex(of: anion)!]] as! String) {
                    case "P": Text("Растворимый")
                    case "H": Text("НЕ растворимый")
                    case "-": Text("Не взаимодействуют").font(.footnote)
                    case "M": Text("Мало растворимый").font(.footnote)
                    default:
                        Text(" Невозможно! ")
                }
                Spacer()
            }
            .foregroundColor(.secondary)
            .background(Color(colorOsadka[[cationy.firstIndex(of: cation)!, aniony.firstIndex(of: anion)!]]!))
            .padding()
            Spacer()
        }
    }
}

struct RastvorimostView_Previews: PreviewProvider {
    static var previews: some View {
        RastvorimostView()
    }
}
