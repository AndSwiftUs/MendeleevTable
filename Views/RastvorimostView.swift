import SwiftUI

struct RastvorimostView: View {
    
    @State var cation: String = "K+"
    @State var anion:  String = "I-"
    
    var body: some View {
        VStack {
            Text("Растворимость:")
            HStack {
                Picker("Катионы", selection: $cation) { ForEach(cationy, id: \.self) { Text($0) } }
                Picker("Анионы", selection: $anion)   { ForEach(aniony,  id: \.self) { Text($0) } }
            }
            Spacer()
            HStack {
                Spacer()
                switch (rasvorimost[[cationy.firstIndex(of: cation)!, aniony.firstIndex(of: anion)!]] as! String) {
                    case "P": Text(" Растворимый ")
                    case "H": Text(" НЕ растворимый ")
                    case "-": Text(" Не взаимодействуют ").font(.footnote)
                    case "M": Text(" Мало растворимый ")
                    default:
                        Text(" Невозможно! ")
                }
                Spacer()
            }
            .foregroundColor(.secondary)
            .background(Color(colorOsadka[[cationy.firstIndex(of: cation)!, aniony.firstIndex(of: anion)!]]!))
            Spacer()
        }
    }
}

struct RastvorimostView_Previews: PreviewProvider {
    static var previews: some View {
        RastvorimostView()
    }
}
