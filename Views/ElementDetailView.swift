import SwiftUI

struct ElementDetailView: View {
    @State var element: Element
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Text("№").font(.footnote)
                    Text("\(element.number!)")
                }
                Text(" \(element.symbol!) ")
                    .font(.title)
                    .foregroundColor(Color(element.bgColor!))
                VStack {
                    Text("\(element.nameRU!)").font(.footnote)
                    Text("\(element.name!)").font(.footnote)
                }
            }
            
            Divider()
            
            ScrollView {
                
                Group {
                    VStack {
                        Text("Атомная масса:").font(.footnote)
                        Text("\(element.atomicMass!)")
                    }
                    Divider()
                    HStack {
                        Text("Период (группа): \(element.period!)")
                        Divider()
                        VStack {
                            //                            Text("Состояние:")
                            Text("\(element.phase ?? "неизвестно")")
                        }
                    }.font(.footnote)
                    
                    Divider()
                    Text("\(element.category!)").font(.footnote)
                    
                    VStack {
                        Divider()
                        Text("Эле́ктроотрица́тельность").font(.footnote).lineLimit(1)
                        Text("\(element.electronegativityPauling ?? 0)")
                        Divider()
                    }
                }
                
                Text("Электронная конфигурация:").font(.footnote).padding()
                NavigationLink {
                    AsyncImage(url: URL(string: element.bohrModelImage!)!) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                } label: {
                    VStack {
                        Text("\(element.electronConfiguration!)").font(.footnote).foregroundColor(.secondary)
                        Text("\(element.electronConfigurationSemantic!)").padding()
                    }
                }
                
                Divider()
                
                HStack {
                    NavigationLink {
                        AsyncImage(url: URL(string: (element.image?.url!)!)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    } label: {
                        AsyncImage(url: URL(string: (element.image?.url!)!)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                    }.buttonStyle(.plain)
                    
                    if element.appearance != nil { Text(element.appearance!).font(.footnote)
                    }
                }
                
                Divider()
                
                if element.melt != nil {
                    VStack {
                        Text("Температура плавления:").font(.footnote)
                        Text("\(element.melt!)")
                    }
                    Divider()
                }
                
                if element.molarHeat != nil {
                    VStack {
                        Text("Моля́рная теплоёмкость:").font(.footnote)
                        Text("\(element.molarHeat!)")
                    }
                    Divider()
                }
                
                if element.density != nil {
                    VStack {
                        Text("Плотность:").font(.footnote)
                        Text("\(element.density!)")
                    }
                    Divider()
                }
                
                if element.summary != nil {
                    Text(element.summary!).font(.footnote).padding()
                    Divider()
                }
            }
        }
    }
}

struct ElementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ElementDetailView(element: PeriodicTableOfElements().elements.randomElement()!)
    }
}
